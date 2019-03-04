get.matches <- function(username, password, season_id, competition_id, version = "v1",
                        baseurl = "https://data.statsbombservices.com/api/",
                        remove.deleted.matches = TRUE){
  competition_id <- competition_id
  season_id <- season_id
  matches.url <- paste0(baseurl, version, "/competitions/", competition_id,
                        "/seasons/", season_id, "/matches")
  raw.match.api <- GET(url = matches.url, authenticate(username, password))
  matches.string <- rawToChar(raw.match.api$content)
  Encoding(matches.string) <- "UTF-8"
  matches <- fromJSON(matches.string, flatten = T)
  matches <- as_tibble(matches)
  if(remove.deleted.matches == TRUE){
    matches <- matches %>%
      filter(!match_status %in% c("deleted"))
  }
  return(matches)
}
