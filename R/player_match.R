player_match = function (username, password, match_id, version = "v5", baseurl = "https://data.statsbomb.com/api/") 
{
  player_match <- tibble()
  player_match.url <- paste0(baseurl, version,"/matches/",  match_id,"/player-stats")
  raw.player_match.api <- GET(url = player_match.url, authenticate(username, 
                                                       password))
  player_match.string <- rawToChar(raw.player_match.api$content)
  Encoding(player_match.string) <- "UTF-8"
  player_match <- fromJSON(player_match.string, flatten = T)
  if (length(player_match) == 0) {
    player_match <- tibble()
  }
  else {
    player_match <- player_match %>% mutate(match_id = match_id)
  }
  return(player_match)
}
