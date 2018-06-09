StatsBombFreeLineups <- function(MatchesDF = "ALL", Parallel = T){
  print("Whilst we are keen to share data and facilitate research, we also urge you to be responsible with the data. Please register your details on https://www.statsbomb.com/resource-centre and read our User Agreement carefully.")
  events.df <- tibble()

  if(Parallel == T){
    if(MatchesDF == "ALL"){
      Comp <- FreeCompetitions()
      Matches2 <- FreeMatches(Comp$competition_id)

      cl <- makeCluster(detectCores())
      registerDoParallel(cl)


      events.df <- foreach(i = 1:dim(Matches2)[1], .combine=bind_rows, .multicombine = TRUE,
                           .errorhandling = 'remove', .export = c("get.lineupsFree"),
                           .packages = c("httr", "jsonlite", "dplyr")) %dopar%
                           {get.lineupsFree(Matches2[i,])}

      stopCluster(cl)


    } else { ##Begin else Parallel == T All = F

      cl <- makeCluster(detectCores())
      registerDoParallel(cl)

      events.df <- foreach(i = 1:dim(MatchesDF)[1], .combine=bind_rows, .multicombine = TRUE,
                           .errorhandling = 'remove', .export = c("get.lineupsFree"),
                           .packages = c("httr", "jsonlite", "dplyr")) %dopar%
                           {get.lineupsFree(MatchesDF[i,])}

      stopCluster(cl)

    }
  }  else { #Begin Else, parallel == F
    if(MatchesDF == "ALL"){
      Comp <- FreeCompetitions()
      Matches2 <- FreeMatches(Comp$competition_id)
      for(i in 1:length(Matches2$match_id)){
        events <- get.lineupsFree(Matches2[i,])
        events.df <- bind_rows(events.df, events)
      }

    } else {
      for(i in 1:length(MatchesDF$match_id)){
        events <- get.lineupsFree(MatchesDF[i,])
        events.df <- bind_rows(events.df, events)
      }

    }
  } #End else parallel
  return(events.df)
} ##End function

