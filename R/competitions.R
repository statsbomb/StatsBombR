competitions <- function(username, password, version = "v5",
                         baseurl = "https://data.statsbombservices.com/api/"){
  comp.url <- paste0(baseurl, version, "/competitions")
  raw.comp.api <- GET(url = comp.url, authenticate(username, password))
  competitions.string <- rawToChar(raw.comp.api$content)
  comp <- fromJSON(competitions.string, flatten = T)
  return(comp)
}


