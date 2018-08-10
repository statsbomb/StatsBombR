allclean <- function(dataframe){
  dataframe <- dataframe %>% dplyr::select(-num_range("shot", 1:20))
  dataframe <- cleanlocations(dataframe)
  dataframe <- goalkeeperinfo(dataframe)
  dataframe <- shotinfo(dataframe)
  dataframe <- freezeframeinfo(dataframe)
  dataframe <- formatelapsedtime(dataframe)
  dataframe <- possessioninfo(dataframe)
  return(dataframe)
}
