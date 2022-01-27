team_season = function (username, password, competition_id, season_id, version = "v5", baseurl = "https://data.statsbomb.com/api/") 
{
  team_season <- tibble()
  team_season.url <- paste0(baseurl, version,"/competitions/",competition_id, "/seasons/", season_id, "/team-stats")
  raw.team_season.api <- GET(url = team_season.url, authenticate(username, 
                                                       password))
  team_season.string <- rawToChar(raw.team_season.api$content)
  Encoding(team_season.string) <- "UTF-8"
  team_season <- fromJSON(team_season.string, flatten = T)
  if (length(team_season) == 0) {
    team_season <- tibble()
  }
  else {
    NA
  }
  return(team_season)
}
