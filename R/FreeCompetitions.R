FreeCompetitions <- function(){
  print("Whilst we are keen to share data and facilitate research, we also urge you to be responsible with the data. Please credit StatsBomb as your data source when using the data and visit https://statsbomb.com/media-pack/ to obtain our logos for public use.")
  Competitions.url <- "https://raw.githubusercontent.com/statsbomb/open-data/master/data/competitions.json"
  raw.competitions <- GET(url = Competitions.url)
  competitions.string <- rawToChar(raw.competitions$content)
  competitions <- fromJSON(competitions.string, flatten = T)

  return(competitions)
}
