team_match_multicomp = function (username, password, competitionmatrix, version = "v1", 
                                   baseurl = "https://data.statsbomb.com/api/", parallel = TRUE, 
                                   cores = detectCores()) 
{
  team_matches_multicomp <- tibble()
  for (i in 1:dim(competitionmatrix)[1]) {
    temp.matches <- tibble()
    competition_id <- as.numeric(competitionmatrix[i, 1])
    season_id <- as.numeric(competitionmatrix[i, 2])
    matches <- matchesvector(username, password, season_id, 
                             competition_id, version, baseurl)
    temp.matches <- team_all_matches(username, password, matches, 
                                       version, baseurl, parallel, cores)
    temp.matches <- temp.matches %>% mutate(competition_id = competition_id, 
                                            season_id = season_id)
    team_matches_multicomp <- bind_rows(team_matches_multicomp, temp.matches)
  }
  team_matches_multicomp <- team_matches_multicomp %>% dplyr::select(-num_range("shot", 1:20))
  return(team_matches_multicomp)
}
