##Multi Competition Events Function.
StagingMultiCompEvents <- function(username, password, competitionmatrix){
  strt<-Sys.time()
  cl <- makeCluster(detectCores())
  registerDoParallel(cl)
  events <- tibble()
  for(i in 1:dim(competitionmatrix)[1]){
    temp.matches <- tibble()
    competition_id <- as.numeric(competitionmatrix[i, 1])
    season_id <- as.numeric(competitionmatrix[i, 2])
    matches <- stagingmatches(username, password, season_id, competition_id)
    temp.matches <- foreach(i = matches, .combine=bind_rows, .multicombine = TRUE,
                            .errorhandling = 'remove', .export = c("stagingevents"),
                            .packages = c("httr", "jsonlite", "dplyr")) %dopar%
                            {stagingevents(username = username, password = password,
                                           i, season_id, competition_id)}
    events <- bind_rows(events, temp.matches)
  }
  stopCluster(cl)
  events <- events %>% dplyr::select(-num_range("shot", 1:20))
  print(Sys.time()-strt)
  return(events)
}

##Pull Competitions From the Staging API
#tempcomps <- stagingcomps(username, password)
##Filter for the competitions you want
#EuropeComps <- tempcomps %>% filter(country_name == "Europe")
##Create a matrix of the competition and season ids
#competitionmatrix <- as.matrix(EuropeComps[,1:2])
##Pull all of the events.
#Events <- StagingMultiCompEvents(username, password, competitionmatrix)
