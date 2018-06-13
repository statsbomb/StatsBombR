get.lineupsFree <- function(Match){
  print("Whilst we are keen to share data and facilitate research, we also urge you to be responsible with the data. Please register your details on https://www.statsbomb.com/resource-centre and read our User Agreement carefully.")
  Events.url <- paste0("https://raw.githubusercontent.com/statsbomb/open-data/master/data/lineups/",
                       Match$match_id[1], ".json")
  raw.events.api <- GET(url = Events.url)
  events.string <- rawToChar(raw.events.api$content)
  Encoding(events.string) <- "UTF-8"
  events <- fromJSON(events.string, flatten = T)
  events <- events %>% mutate(match_id = Match$match_id[1],
                              competition_id = Match$competition.competition_id[1],
                              season_id = Match$season.season_id[1])
  return(events)
}
