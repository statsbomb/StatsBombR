cleanlineups <- function(lineups){
  #Open up the nested lineup dataframe and flatten it.
  myList <- lineups$lineup
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

  df <- df %>% mutate(id = as.numeric(id))

  ##Index Length
  idtable <- lineups %>%
    mutate(id = unique(as.numeric(df$id))) %>%
    select(-lineup)

  #Join with the freeze frame table
  df <- left_join(df, idtable) %>%
    select(-id)

  return(df)
}
