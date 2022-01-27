alllineups <- function(username = username, password = password, matchesvector, parallel = T, version = "v5",
                       baseurl = "https://data.statsbomb.com/api/"){
  if(parallel == T){
    cl <- makeCluster(detectCores())
    registerDoParallel(cl)

    #start time
    strt<-Sys.time()

    lineups <- foreach(i = matchesvector, .combine=bind_rows, .multicombine = TRUE,
                            .errorhandling = 'remove', .export = c("get.lineups"),
                            .packages = c("httr", "jsonlite", "dplyr")) %dopar%
                            {get.lineups(username = username, password = password, i, version = version, baseurl = baseurl)}

    print(Sys.time()-strt)
    stopCluster(cl)
  } else {
    #start time
    strt<-Sys.time()
    lineups <- tibble()
    for(i in matchesvector){
      line1 <- get.lineups(username, password, matchesvector[i], version = version, baseurl = baseurl)
      lineups <- bind_rows(lineups, line1)
    }
    print(Sys.time()-strt)
  }
  return(lineups)
}

