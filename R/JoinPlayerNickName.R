JoinPlayerNickName <- function(events, username, password){
  match_ids <- unique(events$match_id)
  lineups <- alllineups(username, password, match_ids, version = "v5")
  lineups <- cleanlineups(lineups)
  lineups <- lineups %>%
    mutate(player_nickname = ifelse(is.na(player_nickname), player_name, player_nickname))
  lineups <- lineups %>%
    select(player.id = player_id, player.nickname = player_nickname) %>%
    group_by(player.id) %>%
    slice(1) %>%
    ungroup()
  events <- events %>%
    left_join(lineups)
  return(events)
}
