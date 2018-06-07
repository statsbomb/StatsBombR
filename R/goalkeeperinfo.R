goalkeeperinfo <- function(dataframe){

  Shots.FF <- dataframe %>%
    dplyr::select(shot.freeze_frame)

  Shots.FF <- as_tibble(Shots.FF)
  head(Shots.FF)

  funct.nest <- function(element){
    if(is.null(dim(element))){
      return(cbind(player.name.GK = NA,
                   player.id.GK = NA,
                   location.x.GK = NA,
                   location.y.GK = NA))
    } else
    ff.df <- element %>%
      filter(teammate == "FALSE" & position.name == "Goalkeeper")
    ff.df <- ff.df %>%
      mutate(location.x = str_extract(location, "[:digit:]+"),
             location.y = str_extract(location, "[:blank:][:digit:]+")) %>%
      mutate(location.x = as.numeric(location.x),
             location.y = as.numeric(location.y))
    if(dim(ff.df)[1] == 0){
      return(cbind(player.name.GK = NA,
                   player.id.GK = NA,
                   location.x.GK = NA,
                   location.y.GK = NA))
    } else {
      return(cbind(player.name.GK = ff.df$player.name,
                   player.id.GK = ff.df$player.id,
                   location.x.GK = ff.df$location.x,
                   location.y.GK = ff.df$location.y))
    }

  }

  Shots.FF <- Shots.FF %>%
    mutate(gk = map(.$shot.freeze_frame, funct.nest))

  Shots.FF <- Shots.FF %>%
    mutate(player.name.GK = as.character(map(.$gk, 1)),
           player.id.GK = as.integer(map(.$gk, 2)),
           location.x.GK = as.integer(map(.$gk, 3)),
           location.y.GK = as.integer(map(.$gk, 4)))

  Shots.FF <- Shots.FF %>% dplyr::select(-shot.freeze_frame, -gk)
  return(bind_cols(dataframe, Shots.FF))

}
