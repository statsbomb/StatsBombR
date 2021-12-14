team_season_multicomp = function (username, password, competitionmatrix, version = "v6", 
          baseurl = "https://data.statsbombservices.com/api/", parallel = TRUE, 
          cores = detectCores()) 
{
  events <- tibble()
  for (i in 1:dim(competitionmatrix)[1]) {
    team_seasons <- tibble()
    competition_id <- as.numeric(competitionmatrix[i, 1])
    season_id <- as.numeric(competitionmatrix[i, 2])
    team_seasons = team_season(username, password, competition_id, season_id)
    events <- bind_rows(events, team_seasons)
  }
  return(events)
}
