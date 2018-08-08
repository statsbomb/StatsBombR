goalkeeperinfo <- function(dataframe){
  Shots.FF <- dataframe %>%
    filter(type.name == "Shot") %>%
    dplyr::select(id, shot.freeze_frame)
  Shots.FF <- as.tibble(Shots.FF)
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

  Shots.FFout <- lapply(Shots.FF$shot.freeze_frame, funct.nest)

  namefunct <- function(element){
    return(element[1,1])
  }
  idfunct <- function(element){
    return(element[1,2])
  }
  xfunct <- function(element){
    return(element[1,3])
  }
  yfunct <- function(element){
    return(element[1,4])
  }

  Shots.FF$player.name.GK <- as.character(lapply(Shots.FFout, namefunct))
  Shots.FF$player.id.GK <- as.numeric(lapply(Shots.FFout, idfunct))
  Shots.FF$location.x.GK <- as.numeric(lapply(Shots.FFout, xfunct))
  Shots.FF$location.y.GK <- as.numeric(lapply(Shots.FFout, yfunct))

  Shots.FF <- Shots.FF %>% select(-shot.freeze_frame)
  dataframe <- left_join(dataframe, Shots.FF)
  return(dataframe)

}
