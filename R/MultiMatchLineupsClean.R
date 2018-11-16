MultiMatchLineupsClean <- function(username, password, matchesvector, parallel = T){

  if(parallel == T){
    cl <- makeCluster(detectCores())
    registerDoParallel(cl)

    #start time
    strt<-Sys.time()

    lineups <- foreach(i = matchesvector, .combine=bind_rows, .multicombine = TRUE,
                            .errorhandling = 'remove', .export = c("get.lineups"),
                            .packages = c("httr", "jsonlite", "dplyr")) %dopar%
                            {get.lineups(username = username, password = password, i)}

    print(Sys.time()-strt)
    stopCluster(cl)
  } else {
    #start time
    strt<-Sys.time()
    lineups <- tibble()
    for(i in matchesvector){
      line1 <- get.lineups(username, password, matchesvector[i])
      lineups <- bind_rows(lineups, line1)
    }
    print(Sys.time()-strt)
  }

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

  ##Index Length
  idtable <- lineups %>% mutate(id = unique(df$id)) %>% select(-lineup)

  #Join with the freeze frame table
  df <- left_join(df, idtable)

  return(df)
}
