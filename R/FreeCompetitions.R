FreeCompetitions <- function(){
  Competitions.url <- "https://raw.githubusercontent.com/statsbomb/open-data/master/data/competitions.json"
  raw.competitions <- GET(url = Competitions.url)
  competitions.string <- rawToChar(raw.competitions$content)
  competitions <- fromJSON(competitions.string, flatten = T)

  return(competitions)
}
