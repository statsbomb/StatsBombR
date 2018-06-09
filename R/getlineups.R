get.lineups <- function(username, password,
                        match_id, season_id, competition_id){
  events <- tibble()
  Events.url <- paste0("https://data.statsbombservices.com/api/v1/lineups/", match_id)
  raw.events.api <- GET(url = Events.url, authenticate(username, password))
  events.string <- rawToChar(raw.events.api$content)
  events <- fromJSON(events.string, flatten = T)
  if(length(events) == 0){
    events <- tibble() #Some of the matches in the premier league are not available yet.
  } else {
    events <- events %>% mutate(match_id = match_id,
                                competition_id = competition_id,
                                season_id = season_id)
  }
  return(events)
}
