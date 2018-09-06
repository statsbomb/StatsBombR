stagingcomps <- function(username, password){
  comp.url <- "https://staging.data.statsbombservices.com/api/v1/competitions"
  raw.comp.api <- GET(url = comp.url, authenticate(username, password))
  competitions.string <- rawToChar(raw.comp.api$content)
  comp <- fromJSON(competitions.string, flatten = T)
  return(comp)
}
