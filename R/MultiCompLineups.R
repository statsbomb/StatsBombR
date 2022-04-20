MultiCompLineups = function (username, password, competitionmatrix, version = "v6", 
          baseurl = "https://data.statsbomb.com/api/", parallel = TRUE, 
          cores = detectCores()) 
{
  events <- tibble()
  for (i in 1:dim(competitionmatrix)[1]) {
    temp.lineups <- tibble()
    competition_id <- as.numeric(competitionmatrix[i, 1])
    season_id <- as.numeric(competitionmatrix[i, 2])
    matches <- matchesvector(username, password, season_id, 
                             competition_id, version, baseurl)
    temp.lineups <- alllineups(username, password, matches, 
                              version, parallel = TRUE)
    events <- bind_rows(events, temp.lineups)
  }
  return(events)
  
}
