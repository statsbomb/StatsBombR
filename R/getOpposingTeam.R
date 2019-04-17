getOpposingTeam <- function(events){
  Teams <- events %>%
    group_by(match_id, team.name, team.id) %>%
    slice(1) %>%
    select(match_id, team.name, team.id)

  Team1 <- Teams %>% group_by(match_id) %>% slice(1) %>% rename(Team1 = team.name, Team1.id = team.id)
  Team2 <- Teams %>% group_by(match_id) %>% slice(2) %>% rename(Team2 = team.name, Team2.id = team.id)

  Teams <- left_join(Team1, Team2) %>%
    rename(team.name = Team1, team.id = Team1.id, OpposingTeam = Team2, OpposingTeam.id = Team2.id)
  TeamsO <- left_join(Team2, Team1) %>%
    rename(team.name = Team2, team.id = Team2.id, OpposingTeam = Team1, OpposingTeam.id = Team1.id)

  Teams <- bind_rows(Teams, TeamsO)  %>% arrange(match_id)

  events <- left_join(events, Teams)
  return(events)
}
