free_allevents <- function (MatchesDF = "ALL", Parallel = T) 
{
  print("Whilst we are keen to share data and facilitate research, we also urge you to be responsible with the data. Please credit StatsBomb as your data source when using the data and visit https://statsbomb.com/media-pack/ to obtain our logos for public use.")
  events.df <- tibble()
      cl <- makeCluster(detectCores())
      registerDoParallel(cl)
      events.df <- foreach(i = 1:dim(MatchesDF)[1], .combine = bind_rows, 
                           .multicombine = TRUE, .errorhandling = "remove", 
                           .export = c("get.matchFree"), .packages = c("httr", 
                                                                       "jsonlite", "dplyr")) %dopar% {
                                                                         get.matchFree(MatchesDF[i, ])
                                                                       }
  return(events.df)
}
