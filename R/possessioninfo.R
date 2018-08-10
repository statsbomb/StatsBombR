possessioninfo <- function(dataframe){
  dataframe <- dataframe %>%
    group_by(match_id, possession) %>%
    mutate(StartOfPossession = min(ElapsedTime),
           TimeInPoss = ElapsedTime - StartOfPossession,
           TimeToPossEnd = max(ElapsedTime) - ElapsedTime) %>%
    ungroup()
  return(dataframe)
}
