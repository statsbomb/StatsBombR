allmatches <- function(username = username, password = password, matches, version = "v1",
                       baseurl = "https://data.statsbombservices.com/api/", parallel = TRUE, cores = detectCores()){
  if(parallel == T){
    if(cores == detectCores()){
      cl <- makeCluster(detectCores())
    } else {
      cl <- makeCluster(cores)
    }
    registerDoParallel(cl)

    #start time
    strt<-Sys.time()
    temp.matches <- foreach(i = matches, .combine=bind_rows, .multicombine = TRUE,
                            .errorhandling = 'remove', .export = c("get.match"),
                            .packages = c("httr", "jsonlite", "dplyr")) %dopar%
                            {get.match(username = username, password = password,
                                       i, version, baseurl)}

    print(Sys.time()-strt)
    stopCluster(cl)
  } else {
    #start time
    strt<-Sys.time()
    temp.matches <- tibble()
    for(i in matches){
      match_id <- paste0(i)
      Events.url <- paste0("https://data.statsbombservices.com/api/v1/events/", match_id)
      raw.events.api <- GET(url = Events.url, authenticate(username, password))
      events.string <- rawToChar(raw.events.api$content)
      Encoding(events.string) <- "UTF-8"
      events <- fromJSON(events.string, flatten = T)
      if(length(events) == 0){
        temp.matches <- temp.matches #Some of the matches in the premier league are not available yet.
      } else {
        events <- events %>% mutate(match_id = i)
        temp.matches <- bind_rows(temp.matches, events)
      }
    }
    print(Sys.time()-strt)
  }
  temp.matches <- temp.matches %>% dplyr::select(-num_range("shot", 1:20))
  return(temp.matches)
}

