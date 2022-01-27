player_season = function (username, password, competition_id, season_id, version = "v5", baseurl = "https://data.statsbomb.com/api/") 
{
  player_season <- tibble()
  player_season.url <- paste0(baseurl, version,"/competitions/",competition_id, "/seasons/", season_id, "/player-stats")
  raw.player_season.api <- GET(url = player_season.url, authenticate(username, 
                                                       password))
  player_season.string <- rawToChar(raw.player_season.api$content)
  Encoding(player_season.string) <- "UTF-8"
  player_season <- fromJSON(player_season.string, flatten = T)
  if (length(player_season) == 0) {
    player_season <- tibble()
  }
  else {
    NA
  }
  return(player_season)
}
