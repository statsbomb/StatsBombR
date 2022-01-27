get_events_360 <- function(username, password,
                           match_id, version = "v5",
                           baseurl = "https://data.statsbomb.com/api/"){
  events <- tibble()
  Events.url <- paste0(baseurl, version, "/360-frames/", match_id)
  raw.events.api <- GET(url = Events.url, authenticate(username, password))
  events.string <- rawToChar(raw.events.api$content)
  Encoding(events.string) <- "UTF-8"
  events <- fromJSON(events.string, flatten = T)
  if(length(events) == 0){
    events <- tibble()
  } else {
    events <- events %>% mutate(match_id = match_id)
  }
  return(events)
}
