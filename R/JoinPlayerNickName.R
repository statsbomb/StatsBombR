JoinPlayerNickName <- function(events, username, password){
  match_ids <- unique(events$match_id)
  lineups <- alllineups(username, password, match_ids, version = "v2")
  lineups <- cleanlineups(lineups)
  lineups <- lineups %>%
    mutate(player_nickname = ifelse(is.na(player_nickname), player_name, player_nickname))
  lineups <- lineups %>%
    select(player_id, player_nickname)
  events <- events %>%
    left_join(lineups)
  return(events)
}
