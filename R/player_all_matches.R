player_all_matches = function (username = username, password = password, matches, 
          version = "v5", baseurl = "https://data.statsbombservices.com/api/", 
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
                            .export = c("player_match"), .packages = c("httr", 
                                                                     "jsonlite", "dplyr")) %dopar% {
                                                                       player_match(username = username, password = password, 
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
      player_matches <- tibble()
      player_matches.url <- paste0(baseurl, version,"/matches/",  match_id,"/player-stats")
      raw.player_matches.api <- GET(url = player_matches.url, authenticate(username, 
                                                           password))
      player_matches.string <- rawToChar(raw.player_matches.api$content)
      Encoding(player_matches.string) <- "UTF-8"
      player_matches <- fromJSON(player_matches.string, flatten = T)
      if (length(player_matches) == 0) {
        player_matches <- tibble()
      }
      else {
        player_matches <- player_matches %>% mutate(match_id = i)
        temp.matches <- bind_rows(temp.matches, player_matches)
      }
    }
    print(Sys.time() - strt)
  }
  temp.matches <- temp.matches %>% dplyr::select(-num_range("shot", 
                                                            1:20))
  return(temp.matches)
}
