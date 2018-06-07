defensiveinfo <- function(dataframe){


  Shots.FF <- dataframe %>%
    dplyr::select(shot.freeze_frame, location.x, location.y, DistToGoal, AngleToGoal)

  Shots.FF <- as_tibble(Shots.FF)
  Shots.FF <- Shots.FF %>%
    mutate(Angle.New = ifelse(AngleToGoal > 90, 180 - AngleToGoal, AngleToGoal)) %>%
    mutate(Angle.Rad = Angle.New*pi/180) %>%
    mutate(Dist.x = 120 - location.x,
           Dist.y = ifelse(location.y > 40, location.y - 40, 40 -location.y)) %>%
    mutate(new.Dx = (sin(Angle.Rad)*(DistToGoal+1)),
           new.Dy = (cos(Angle.Rad)*(DistToGoal+1)) ) %>%
    mutate(new.x =  120 - new.Dx,
           new.y =  ifelse(location.y < 40, 40 - new.Dy,
                           new.Dy + 40)) %>%
    mutate(new.xF = ifelse((new.x < location.x & new.y < location.y  & location.y <= 40) |
                             (new.x < location.x & new.y > location.y  & location.y >= 40),
                           new.x, 120 - new.Dy),
           new.yF = ifelse((new.x < location.x & new.y < location.y  & location.y <= 40) |
                             (new.x < location.x & new.y > location.y  & location.y >= 40),
                           new.y, ifelse(location.y > 40, 40 + new.Dx, 40 - new.Dx)),
           new.xF = ifelse(AngleToGoal == 90, 120 - (DistToGoal + 1), new.xF),
           new.yF = ifelse(AngleToGoal == 90, location.y, new.yF))

  cleanFF <- function(ff, x, y, newx, newy){
    element <- ff
    if(is.null(dim(element))){
      return(cbind(density = NA,
                   density.incone = NA,
                   distance.ToD1 = NA,
                   distance.ToD2 = NA))
    } else
      ff.df <- element %>%
        filter(teammate == "FALSE" & position.name != "Goalkeeper")
    ff.df <- ff.df %>%
      mutate(location.x = str_extract(location, "[:digit:]+"),
             location.y = str_extract(location, "[:blank:][:digit:]+")) %>%
      mutate(location.x = as.numeric(location.x),
             location.y = as.numeric(location.y))
    if(dim(ff.df)[1] == 0){
      return(cbind(density = NA,
                   density.incone = NA,
                   distance.ToD1 = NA,
                   distance.ToD2 = NA))
    } else {
      ##Create the cone
      Cone.df <- rbind(c(120, 36 - 1),
                       c(120, 44 + 1),
                       c(newx, newy))
      ff.df <- ff.df %>%
        mutate(distance = sqrt((x - location.x)^2 +
                                 (y - location.y)^2)) %>%
        mutate(distance = ifelse(distance== 0, 0.0001, distance))

      ff.df$InCone <- pnt.in.poly(cbind(ff.df$location.x, ff.df$location.y), Cone.df)$pip

      ff.dfD <- ff.df %>%
        filter(location.x >= newx) %>%
        summarise(Density = sum(1/distance))

      if(dim(ff.dfD)[1] == 0){
        density = 0
      } else {
        density = ff.dfD$Density
      }

      ff.dfIn <- ff.df %>%
        filter(InCone == 1) %>%
        summarise(Density = sum(1/distance))

      if(dim(ff.dfIn)[1] == 0){
        density.incone = 0
      } else {
        density.incone = ff.dfIn$Density
      }

      Dist1 <- ff.df %>%
        filter(location.x >= newx ) %>%
        arrange((distance)) %>%
        slice(1) %>%
        select(distance)

      if(dim(Dist1)[1] == 0){
        distance.ToD1 = Inf
      } else {
        distance.ToD1 = Dist1$distance
      }

      Dist2 <- ff.df %>%
        filter(location.x >= newx) %>%
        arrange((distance)) %>%
        slice(2) %>%
        select(distance)

      if(dim(Dist2)[1] == 0){
        distance.ToD2 = Inf
      } else {
        distance.ToD2 = Dist2$distance
      }

      return(cbind(density = density,
                   density.incone = density.incone,
                   distance.ToD1 = distance.ToD1,
                   distance.ToD2 = distance.ToD2))
    }

  } ##End cleanFF function

  Shots.FF <- Shots.FF %>%
    mutate(FFinfo = pmap(list(shot.freeze_frame, location.x, location.y, new.x, new.y), cleanFF))

  Shots.FF <- Shots.FF %>%
    mutate(density = as.numeric(map(.$FFinfo, 1)),
           density.incone = as.numeric(map(.$FFinfo, 2)),
           distance.ToD1 = as.numeric(map(.$FFinfo, 3)),
           distance.ToD2 = as.numeric(map(.$FFinfo, 4)))

  Shots.FF <- Shots.FF %>% dplyr::select(density, density.incone, distance.ToD1, distance.ToD2)
  return(bind_cols(dataframe, Shots.FF))

} ##End Defensive Info Function
