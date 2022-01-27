allevents_360 = function (username = username, password = password, matches,
                          version = "v5", baseurl = "https://data.statsbomb.com/api/",
                          parallel = TRUE, cores = detectCores())
{
  if (parallel == T) {
    if (cores == detectCores()) {
      cl <- makeCluster(detectCores())
    }
    else {
      cl <- makeCluster(cores)
    }
    registerDoParallel(cl)
    strt <- Sys.time()
    temp.matches <- foreach(i = matches, .combine = bind_rows,
                            .multicombine = TRUE, .errorhandling = "remove",
                            .export = c("get_events_360"), .packages = c("httr",
                                                                         "jsonlite", "dplyr")) %dopar% {
                                                                           get_events_360(username = username, password = password,
                                                                                          i, version, baseurl)
                                                                         }
    print(Sys.time() - strt)
    stopCluster(cl)
  }
  else {
    strt <- Sys.time()
    temp.matches <- tibble()
    for (i in matches) {
      match_id <- paste0(i)
      Events.url <- paste0("https://data.statsbombservices.com/api/v5/360-frames/",
                           match_id)
      raw.events.api <- GET(url = Events.url, authenticate(username,
                                                           password))
      events.string <- rawToChar(raw.events.api$content)
      Encoding(events.string) <- "UTF-8"
      events <- fromJSON(events.string, flatten = T)
      if (length(events) == 0) {
        temp.matches <- temp.matches
      }
      else {
        events <- events %>% mutate(match_id = i)
        temp.matches <- bind_rows(temp.matches, events)
      }
    }
    print(Sys.time() - strt)
  }
  return(temp.matches)
}
