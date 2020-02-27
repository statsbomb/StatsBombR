get.lineups <- function(username, password, match_id, version = "v5",
                        baseurl = "https://data.statsbombservices.com/api/"){
  events <- tibble()
  Events.url <- paste0(baseurl, version, "/lineups/", match_id)
  raw.events.api <- GET(url = Events.url, authenticate(username, password))
  events.string <- rawToChar(raw.events.api$content)
  Encoding(events.string) <- "UTF-8"
  events <- fromJSON(events.string, flatten = T)
  if(length(events) == 0){
    events <- tibble() #Some of the matches in the premier league are not available yet.
  } else {
    events <- events %>% mutate(match_id = match_id)
  }
  return(events)
}
