FreeCompetitions <- function(){
  print("Whilst we are keen to share data and facilitate research, we also urge you to be responsible with the data. Please register your details on https://www.statsbomb.com/resource-centre and read our User Agreement carefully.")
  Competitions.url <- "https://raw.githubusercontent.com/statsbomb/open-data/master/data/competitions.json"
  raw.competitions <- GET(url = Competitions.url)
  competitions.string <- rawToChar(raw.competitions$content)
  competitions <- fromJSON(competitions.string, flatten = T)

  return(competitions)
}
