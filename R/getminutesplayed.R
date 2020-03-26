get.minutesplayed =  function (AllEvents) 
{
  Matches <- AllEvents %>% group_by(match_id) %>% filter(ElapsedTime == 
                                                           max(ElapsedTime)) %>% select(match_id, GameEnd = ElapsedTime) %>% 
    dplyr::slice(1)
  StartingXI <- AllEvents %>% filter(type.name == "Starting XI") %>% 
    select(id, match_id, team.id, tactics.lineup)
  myList <- StartingXI$tactics.lineup
  fixnull <- function(x) {
    if (is.data.frame(x)) {
      return(x)
    }
    else {
      return(setNames(data.frame(matrix(ncol = ncol(myList[[1]]), 
                                        nrow = 1)), names(myList[[1]])))
    }
  }
  myList <- lapply(myList, fixnull)
  df <- bind_rows(myList, .id = "id")
  idtable <- df %>% mutate(id = as.numeric(id)) %>% group_by(id) %>% 
    dplyr::slice(1) %>% select(id) %>% ungroup() %>% mutate(sbid = StartingXI$id) %>% 
    mutate(id = as.character(id)) %>% mutate(match_id = StartingXI$match_id, 
                                             team.id = StartingXI$team.id)
  df <- left_join(df, idtable)
  df <- df %>% select(-id) %>% rename(id = sbid) %>% select(id, 
                                                            everything())
  df <- df %>% mutate(TimeOn = 0)
  df <- df %>% select(player.id, match_id, team.id, TimeOn)
  Subs <- AllEvents %>% filter(type.name == "Substitution" | bad_behaviour.card.name=="Red Card"  | foul_committed.card.name=="Red Card" | bad_behaviour.card.name=="Second Yellow"  | foul_committed.card.name=="Second Yellow") %>% 
    select(match_id, ElapsedTime, Off = player.id, team.id, 
           On = substitution.replacement.id) %>% tidyr::gather(Off, 
                                                               On, key = "Player", value = "OnOff") %>% arrange(match_id, 
                                                                                                                ElapsedTime)
  SubsOff <- Subs %>% filter(Player == "Off") %>% select(-Player, 
                                                         TimeOff = ElapsedTime, player.id = OnOff)
  df <- left_join(df, SubsOff, by = c("player.id", "match_id", 
                                      "team.id"), suffix = c("", ".S"))
  SubsOn <- Subs %>% filter(Player == "On") %>% select(-Player, 
                                                       TimeOn = ElapsedTime, player.id = OnOff)
  df <- bind_rows(df, SubsOn) %>% arrange(match_id, team.id, 
                                          TimeOn)
  df <- df %>% left_join(Matches)
  df <- df %>% mutate(TimeOff = ifelse(is.na(TimeOff), GameEnd, 
                                       TimeOff))
  df <- df %>% mutate(MinutesPlayed = (TimeOff - TimeOn)/60, 
                      TimeOn = TimeOn/60, TimeOff = TimeOff/60, GameEnd = GameEnd/60) %>%
    filter(!is.na(player.id))
  return(df)
}
