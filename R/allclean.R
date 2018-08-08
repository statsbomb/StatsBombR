allclean <- function(dataframe){
  dataframe <- cleanlocations(dataframe)
  dataframe <- goalkeeperinfo(dataframe)
  dataframe <- shotinfo(dataframe)
  dataframe <- freezeframeinfo(dataframe)
  return(dataframe)
}
