player_match_multicomp = function (username, password, competitionmatrix, version = "v5", 
          baseurl = "https://data.statsbombservices.com/api/", parallel = TRUE, 
          cores = detectCores()) 
{
  player_match_multicomp <- tibble()
  for (i in 1:dim(competitionmatrix)[1]) {
    temp.matches <- tibble()
    competition_id <- as.numeric(competitionmatrix[i, 1])
    season_id <- as.numeric(competitionmatrix[i, 2])
    matches <- matchesvector(username, password, season_id, 
                             competition_id, version, baseurl)
    temp.matches <- player_all_matches(username, password, matches, 
                              version, baseurl, parallel, cores)
    temp.matches <- temp.matches %>% mutate(competition_id = competition_id, 
                                            season_id = season_id)
    player_match_multicomp <- bind_rows(player_match_multicomp, temp.matches)
  }
  player_match_multicomp <- player_match_multicomp %>% dplyr::select(-num_range("shot", 1:20))
  return(player_match_multicomp)
}
