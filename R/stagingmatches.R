stagingmatches <- function(username, password, season_id, competition_id){
  competition_id <- competition_id
  season_id <- season_id
  matches.url <- paste0("https://staging.data.statsbombservices.com/api/v1/competitions/", competition_id,
                        "/seasons/", season_id, "/matches")
  raw.match.api <- GET(url = matches.url, authenticate(username, password))
  matches.string <- rawToChar(raw.match.api$content)
  matches <- fromJSON(matches.string, flatten = T)
  return(matches$match_id)
}
