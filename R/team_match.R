team_match = function (username, password, match_id, version = "v1", baseurl = "https://data.statsbomb.com/api/") 
{
  team_match <- tibble()
  team_match.url <- paste0(baseurl, version,"/matches/",  match_id,"/team-stats")
  raw.team_match.api <- GET(url = team_match.url, authenticate(username, 
                                                                   password))
  team_match.string <- rawToChar(raw.team_match.api$content)
  Encoding(team_match.string) <- "UTF-8"
  team_match <- fromJSON(team_match.string, flatten = T)
  if (length(team_match) == 0) {
    team_match <- tibble()
  }
  else {
    team_match <- team_match %>% mutate(match_id = match_id)
  }
  return(team_match)
}
