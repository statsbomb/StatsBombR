getOpposingTeam <- function(events){
  Teams <- events %>%
    group_by(match_id, team.name) %>%
    slice(1) %>%
    select(match_id, team.name)

  Team1 <- Teams %>% group_by(match_id) %>% slice(1) %>% rename(Team1 = team.name)
  Team2 <- Teams %>% group_by(match_id) %>% slice(2) %>% rename(Team2 = team.name)

  Teams <- left_join(Team1, Team2) %>% rename(team.name = Team1, OpposingTeam = Team2)
  TeamsO <- left_join(Team2, Team1) %>% rename(team.name = Team2, OpposingTeam = Team1)

  Teams <- bind_rows(Teams, TeamsO)  %>% arrange(match_id)

  events <- left_join(events, Teams)
  return(events)
}
