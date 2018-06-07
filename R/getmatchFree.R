get.matchFree <- function(Match){
  Events.url <- paste0("https://raw.githubusercontent.com/statsbomb/open-data/master/data/events/",
                       Match$match_id[i], ".json")
  raw.events.api <- GET(url = Events.url)
  events.string <- rawToChar(raw.events.api$content)
  events <- fromJSON(events.string, flatten = T)
  events <- events %>% mutate(match_id = Match$match_id[i],
                              competition_id = Match$competition.competition_id[i],
                              season_id = Match$season.season_id[i])
  return(events)
}

