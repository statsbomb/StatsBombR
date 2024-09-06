team_all_matches = function (username = username, password = password, matches, 
                               version = "v1", baseurl = "https://data.statsbomb.com/api/", 
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
                            .export = c("team_match"), .packages = c("httr", 
                                                                       "jsonlite", "dplyr")) %dopar% {
                                                                         team_match(username = username, password = password, 
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
      team_matches <- tibble()
      team_matches.url <- paste0(baseurl, version,"/matches/",  match_id,"/team-stats")
      raw.team_matches.api <- GET(url = team_matches.url, authenticate(username, 
                                                                           password))
      team_matches.string <- rawToChar(raw.team_matches.api$content)
      Encoding(team_matches.string) <- "UTF-8"
      team_matches <- fromJSON(team_matches.string, flatten = T)
      if (length(team_matches) == 0) {
        team_matches <- tibble()
      }
      else {
        team_matches <- team_matches %>% mutate(match_id = i)
        temp.matches <- bind_rows(temp.matches, team_matches)
      }
    }
    print(Sys.time() - strt)
  }
  temp.matches <- temp.matches %>% dplyr::select(-num_range("shot", 
                                                            1:20))
  return(temp.matches)
}
