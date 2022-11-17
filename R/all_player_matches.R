all_player_matches = function (username = username, password = password, matchesvector, 
                               parallel = T, version = "v5", baseurl = "https://data.statsbomb.com/api/") 
{
  if (parallel == T) {
    cl <- makeCluster(detectCores())
    registerDoParallel(cl)
    strt <- Sys.time()
    player_matches <- foreach(i = matchesvector, .combine = bind_rows, 
                       .multicombine = TRUE, .errorhandling = "remove", 
                       .export = c("player_match"), .packages = c("httr", 
                                                                 "jsonlite", "dplyr")) %dopar% {
                                                                   player_match(username = username, password = password, 
                                                                               i, version = version, baseurl = baseurl)
                                                                 }
    print(Sys.time() - strt)
    stopCluster(cl)
  }
  else {
    strt <- Sys.time()
    player_matches <- tibble()
    for (i in matchesvector) {
      line1 <- player_match(username, password, matchesvector[i], 
                           version = version, baseurl = baseurl)
      player_matches <- bind_rows(player_matches, line1)
    }
    print(Sys.time() - strt)
  }
  return(player_matches)
}
