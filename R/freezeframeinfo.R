freezeframeinfo <- function(dataframe){
  Shots.FF <- dataframe %>%
    filter(type.name == "Shot") %>%
    dplyr::select(id, shot.freeze_frame, location.x, location.y, location.x.GK, location.y.GK, DistToGoal, AngleToGoal)
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
                           new.Dy + 40))

  ##Trying a different method for the speed.
  myList <- Shots.FF$shot.freeze_frame
  fixnull <- function(x) {
    if(is.data.frame(x)){
      return(x)
    } else {
      return(setNames(data.frame(matrix(ncol = ncol(myList[[1]]), nrow = 1)), names(myList[[1]])))
    }
  }

  # Apply the written function above to every element in myList
  myList <- lapply(myList, fixnull)

  # "bind_rows" with mynewList
  df <- bind_rows(myList, .id = "id")

  ##Index Length
  idtable <- df %>%
    mutate(id = as.numeric(id)) %>%
    group_by(id) %>%
    slice(1) %>%
    select(id) %>%
    ungroup() %>%
    mutate(sbid = Shots.FF$id,
           x =Shots.FF$location.x,
           y = Shots.FF$location.y,
           new.x = Shots.FF$new.x,
           new.y = Shots.FF$new.y,
           location.x.GK = Shots.FF$location.x.GK,
           location.y.GK = Shots.FF$location.y.GK) %>%
    mutate(id = as.character(id))

  #Join with the freeze frame table
  df <- left_join(df, idtable)
  df <- df %>% select(-id) %>% rename(id = sbid) %>% select(id, everything())

  ##calculate the new information
  df <- df %>%
    mutate(location.x = (map(location, 1)),
           location.y = (map(location, 2))) %>%
    mutate(location.x = as.numeric(ifelse(location.x == "NULL", NA, location.x)),
           location.y = as.numeric(ifelse(location.y == "NULL", NA, location.y))) %>%
    mutate(distance = sqrt((x - location.x)^2 + (y - location.y)^2)) %>%
    mutate(distance = ifelse(distance== 0, 1/3, distance))

  df <- df %>%
    rowwise() %>%
    mutate(InCone = sp::point.in.polygon(location.x,
                                         location.y,
                                         c(120, 120, new.x),
                                         c(35, 45, new.y))) %>%
    mutate(InCone.GK = sp::point.in.polygon(location.x,
                                            location.y,
                                            c(location.x.GK, location.x.GK, x, x),
                                            c(location.y.GK-1, location.y.GK+1, y-1, y +1)))

  df <- df %>%
    ungroup() %>%
    mutate(InCone = ifelse(InCone > 0, 1, InCone)) %>%
    mutate(InCone.GK = ifelse(InCone.GK > 0, 1, InCone.GK))

  ##Summarise values down for each id
  density <- df %>%
    group_by(id) %>%
    filter(location.x >= x & teammate == FALSE & position.name != "Goalkeeper") %>%
    summarise(density = sum(1/distance))

  density.incone <- df %>%
    group_by(id) %>%
    filter(location.x >= x & teammate == FALSE & InCone == 1  & position.name != "Goalkeeper") %>%
    summarise(density.incone = sum(1/distance))

  DefendersInCone <- df %>%
    group_by(id) %>%
    filter(location.x >= x & InCone == 1 & teammate == FALSE & position.name != "Goalkeeper") %>%
    summarise(DefendersInCone = n())

  InCone.GK <- df %>%
    group_by(id) %>%
    filter(location.x >= x & InCone.GK == 1) %>%
    summarise(InCone.GK = n())

  distance.ToD1 <- df %>%
    group_by(id) %>%
    filter(location.x >= x & teammate == FALSE & position.name != "Goalkeeper") %>%
    arrange(distance) %>%
    slice(1) %>%
    select(id, distance.ToD1 = distance)

  distance.ToD1.360 <- df %>%
    group_by(id) %>%
    filter(teammate == FALSE & position.name != "Goalkeeper") %>%
    arrange(distance) %>%
    slice(1) %>%
    select(id, distance.ToD1.360 = distance)

  distance.ToD2 <- df %>%
    group_by(id) %>%
    filter(location.x >= x & teammate == FALSE & position.name != "Goalkeeper") %>%
    arrange(distance) %>%
    slice(2) %>%
    select(id, distance.ToD2 = distance)

  distance.ToD2.360 <- df %>%
    group_by(id) %>%
    filter(teammate == FALSE & position.name != "Goalkeeper") %>%
    arrange(distance) %>%
    slice(2) %>%
    select(id, distance.ToD2.360 = distance)

  AttackersBehindBall <- df %>%
    group_by(id) %>%
    filter(location.x >= x & teammate == TRUE) %>%
    summarise(AttackersBehindBall = n())

  DefendersBehindBall <- df %>%
    group_by(id) %>%
    filter(location.x >= x & teammate == FALSE & position.name != "Goalkeeper") %>%
    summarise(DefendersBehindBall = n())

  DefArea <- df %>%
    group_by(id) %>%
    mutate(Defender = ifelse(teammate == FALSE & position.id %in% c(2:8), 1, 0)) %>%
    filter(Defender == 1) %>%
    summarise(DefArea = (max(location.x) - min(location.x))*(max(location.y) - min(location.y)))

  #We need to join these
  Shots.FF <- Shots.FF %>%
    left_join(density) %>%
    left_join(density.incone) %>%
    left_join(distance.ToD1) %>%
    left_join(distance.ToD2) %>%
    left_join(InCone.GK) %>%
    left_join(AttackersBehindBall) %>%
    left_join(DefendersBehindBall) %>%
    left_join(DefendersInCone) %>%
    left_join(DefArea) %>%
    left_join(distance.ToD1.360) %>%
    left_join(distance.ToD2.360)

  #We need some way of changing the value if everything gets filtered out.
  ##These are easy.
  Shots.FF <- Shots.FF %>%
    mutate(density = ifelse(is.na(density), 0, density),
           density.incone = ifelse(is.na(density.incone), 0, density.incone),
           AttackersBehindBall = ifelse(is.na(AttackersBehindBall), 0, AttackersBehindBall),
           DefendersBehindBall = ifelse(is.na(DefendersBehindBall), 0, DefendersBehindBall),
           DefendersInCone = ifelse(is.na(DefendersInCone), 0, DefendersInCone),
           InCone.GK = ifelse(is.na(InCone.GK), 0, InCone.GK),
           DefArea = ifelse(is.na(DefArea), 1000, DefArea))

  ##The only ones we need to change are the distance metrics.
  posdist1 <- df %>%
    group_by(id) %>%
    filter(location.x < x & teammate == FALSE) %>%
    arrange(distance) %>%
    slice(1) %>%
    select(id, posdist1 = distance) %>%
    mutate(posdist1 = -posdist1)

  posdist2 <- df %>%
    group_by(id) %>%
    filter(location.x < x & teammate == FALSE) %>%
    arrange(distance) %>%
    slice(2) %>%
    select(id, posdist2 = distance) %>%
    mutate(posdist2 = -posdist2)

  Shots.FF <- Shots.FF %>%
    left_join(posdist1) %>%
    left_join(posdist2)

  Shots.FF <- Shots.FF %>%
    mutate(distance.ToD1 = ifelse(is.na(distance.ToD1) & is.na(posdist1), 30,
                                  ifelse(is.na(distance.ToD1), posdist1, distance.ToD1)),
           distance.ToD2 = ifelse(is.na(distance.ToD2) & is.na(posdist2), 30,
                                  ifelse(is.na(distance.ToD2), posdist2, distance.ToD2)))


  Shots.FF <- Shots.FF %>% dplyr::select(id, density, density.incone, distance.ToD1, distance.ToD2,
                                         AttackersBehindBall, DefendersBehindBall,
                                         DefendersInCone, InCone.GK, DefArea, distance.ToD1.360, distance.ToD2.360)

  dataframe <- left_join(dataframe, Shots.FF)


  return(dataframe)

}
