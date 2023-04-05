player_season_multicomp = function (username, password, competitionmatrix, version = "v4", 
                                  baseurl = "https://data.statsbomb.com/api/", parallel = TRUE, 
                                  cores = detectCores()) 
{
  events <- tibble()
  for (i in 1:dim(competitionmatrix)[1]) {
    player_seasons <- tibble()
    competition_id <- as.numeric(competitionmatrix[i, 1])
    season_id <- as.numeric(competitionmatrix[i, 2])
    player_seasons = player_season(username, password, competition_id, season_id, version)
    events <- bind_rows(events, player_seasons)
  }
  return(events)
}
