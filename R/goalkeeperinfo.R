goalkeeperinfo <- function(dataframe){
  ##This function will not return any information on goalkeeper's when the shot.type.name = "Penalty"
  ##This is because no Freeze Frame is actually recorded.
  ##To get the goalkeeper's name on this penalty, look for the related_event of type.name = "Goal Keeper"
  ##With a goalkeeper.type.name of "Penalty Saved" or "Penalty Conceded".
  Shots.FF <- dataframe %>%
    filter(type.name == "Shot") %>%
    dplyr::select(id, shot.freeze_frame)
  Shots.FF <- as_tibble(Shots.FF)

  ##If the element of the list is a dataframe, return it.
  ###If the element of the list is NULL, No Freeze Frame, Return, a freeze frame with all NAs.
  myList <- Shots.FF$shot.freeze_frame
  fixnull <- function(x) {
    if(is.data.frame(x)){
      return(x)
    } else {
      return(tibble(location = NA,
                    teammate = NA,
                    player.id = NA,
                    player.name = NA,
                    position.id = NA,
                    position.name = NA))
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
    mutate(sbid = Shots.FF$id) %>%
    mutate(id = as.character(id))

  #Join with the freeze frame table
  df <- left_join(df, idtable)
  df <- df %>% select(-id) %>% rename(id = sbid) %>% select(id, everything())

  ##calculate the new information
  df <- df %>%
    filter(teammate == "FALSE" & position.name == "Goalkeeper") %>%
    mutate(location.x = (map(location, 1)),
           location.y = (map(location, 2))) %>%
    mutate(location.x = as.numeric(ifelse(location.x == "NULL", NA, location.x)),
           location.y = as.numeric(ifelse(location.y == "NULL", NA, location.y))) %>%
    select(id, player.name.GK = player.name, player.id.GK = player.id,
           location.x.GK = location.x, location.y.GK = location.y)

  dataframe <- left_join(dataframe, df)
  return(dataframe)
}
