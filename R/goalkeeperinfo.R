goalkeeperinfo <- function(dataframe){
  Shots.FF <- dataframe %>%
    filter(type.name == "Shot") %>%
    dplyr::select(id, shot.freeze_frame)
  Shots.FF <- as_tibble(Shots.FF)

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
    mutate(sbid = Shots.FF$id) %>%
    mutate(id = as.character(id))

  #Join with the freeze frame table
  df <- left_join(df, idtable)
  df <- df %>% select(-id) %>% rename(id = sbid) %>% select(id, everything())

  ##calculate the new information
  df <- df %>%
    filter(teammate == "FALSE" & position.name == "Goalkeeper") %>%
    mutate(location.x = str_extract(location, "[:digit:]+"),
           location.y = str_extract(location, "[:blank:][:digit:]+")) %>%
    mutate(location.x = as.numeric(location.x),
           location.y = as.numeric(location.y)) %>%
    select(id, player.name.GK = player.name, player.id.GK = player.id,
           location.x.GK = location.x, location.y.GK = location.y)

  dataframe <- left_join(dataframe, df)
}
