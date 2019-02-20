##Multi Competition Events Function.
MultiCompEvents <- function(username, password, competitionmatrix, version = "v1",
                            baseurl = "https://data.statsbombservices.com/api/", parallel = TRUE, cores = detectCores()){
  events <- tibble()
  for(i in 1:dim(competitionmatrix)[1]){
    temp.matches <- tibble()
    competition_id <- as.numeric(competitionmatrix[i, 1])
    season_id <- as.numeric(competitionmatrix[i, 2])
    matches <- matchesvector(username, password, season_id, competition_id)
    temp.matches <- allmatches(username, password, matches, version, baseurl, parallel, cores)
    temp.matches <- temp.matches %>%
      mutate(competition_id = competition_id,
             season_id = season_id)
    events <- bind_rows(events, temp.matches)
  }
  events <- events %>% dplyr::select(-num_range("shot", 1:20))
  return(events)
}


##Pull Competitions From the API
#comps <- competitions(username, password)
##Filter for the competitions you want
#EuropeComps <- comps %>% filter(country_name == "Europe")
##Create a matrix of the competition and season ids
#competitionmatrix <- as.matrix(EuropeComps[,1:2])
##Pull all of the events.
#Events <- MultiCompEvents(username, password, competitionmatrix)
