alllineups <- function(username = username, password = password, matches, season_id, competition_id, parallel = T){
  if(parallel == T){
    cl <- makeCluster(detectCores())
    registerDoParallel(cl)

    #start time
    strt<-Sys.time()

    temp.matches <- foreach(i = matches, .combine=bind_rows, .multicombine = TRUE,
                            .errorhandling = 'remove', .export = c("get.lineups"),
                            .packages = c("httr", "jsonlite", "dplyr")) %dopar%
                            {get.lineups(username = username, password = password,
                                       i, season_id, competition_id)}

    print(Sys.time()-strt)
    stopCluster(cl)
  } else {
    #start time
    strt<-Sys.time()
    temp.matches <- tibble()
    for(i in matches){
      match_id <- paste0(i)
      Events.url <- paste0("https://data.statsbombservices.com/api/v1/lineups/", match_id)
      raw.events.api <- GET(url = Events.url, authenticate(username, password))
      events.string <- rawToChar(raw.events.api$content)
      events <- fromJSON(events.string, flatten = T)
      if(length(events) == 0){
        temp.matches <- temp.matches #Some of the matches in the premier league are not available yet.
      } else {
        events <- events %>% mutate(match_id = i,
                                    competition_id = competition_id,
                                    season_id = season_id)
        temp.matches <- bind_rows(temp.matches, events)
      }
    }
    print(Sys.time()-strt)
  }
  return(temp.matches)
}

