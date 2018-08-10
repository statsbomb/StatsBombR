possessioninfo <- function(dataframe){
  dataframe <- dataframe %>% mutate(ChangeInPoss = ifelse(possession_team.name != lag(possession_team.name, 1), 1,  0))
  dataframe <- dataframe %>% mutate(ChangeInPoss = ifelse(is.na(ChangeInPoss), 0,  ChangeInPoss))
  dataframe <- dataframe %>% group_by(match_id) %>% mutate(Possession = cumsum(ChangeInPoss) + 1)
  dataframe <- dataframe %>%
    group_by(match_id, Possession) %>%
    mutate(StartOfPossession = min(ElapsedTime),
           TimeInPoss = ElapsedTime - StartOfPossession,
           TimeToPossEnd = max(ElapsedTime) - ElapsedTime) %>%
    ungroup() %>%
    select(-ChangeInPoss)
  return(dataframe)
}
