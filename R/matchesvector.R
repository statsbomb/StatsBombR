matchesvector <- function(username, password, season_id, competition_id, version = "v5", baseurl = "https://data.statsbomb.com/api/"){
  competition_id <- competition_id
  season_id <- season_id
  matches <- get.matches(username, password, season_id, competition_id, version, baseurl)
  return(matches$match_id)
}
