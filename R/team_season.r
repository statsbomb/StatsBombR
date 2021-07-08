team_season = function (username, password, competition_id, season_id, version = "v5", baseurl = "https://data.statsbombservices.com/api/") 
{
  events <- tibble()
  Events.url <- paste0(baseurl, version,"/competitions/",competition_id, "/seasons/", season_id, "/team-stats")
  raw.events.api <- GET(url = Events.url, authenticate(username, 
                                                       password))
  events.string <- rawToChar(raw.events.api$content)
  Encoding(events.string) <- "UTF-8"
  events <- fromJSON(events.string, flatten = T)
  if (length(events) == 0) {
    events <- tibble()
  }
  else {
    NA
  }
  return(events)
}
