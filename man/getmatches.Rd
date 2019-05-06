\name{get.matches}
\alias{get.matches}
\title{
This function returns all matches from the specified season and competition.}
\description{
For use with the StatsBomb Data API credentials. This function is used to access the JSON file from the StatsBomb API and return the matches in vector form. For reference, the premier league has a competition id = 2 and 2018 is season_id = 1. We apologize for the confusing nature of having a get.matches that returns all of the matches in a competition and the function get.match which returns all of the events in a match.}
\usage{
get.matches(username = "username", password = "password",
            season_id = "season_id", competition_id = "competition_id", version = "v1",
            baseurl = "https://data.statsbombservices.com/api/",
            remove.deleted.matches = TRUE)
}
\arguments{
  \item{username}{Character object of your StatsBomb API username.}
  \item{password}{Character object of your StatsBomb API password.}
  \item{season_id}{Character object of the season_id for the matches you wish to access.}
  \item{competition_id}{Character object of the competition_id for the match you wish to access.}
  \item{version}{Character string of the version of the StatsBomb API you wish to access. Currently version v1, v2, v3 and v4 are supported.}
  \item{remove.deleted.matches}{Boolean variable for whether or not you want the deleted matches to be removed from the returned data frame.}
}
\value{
  \item{df}{Returns a dataframe with all matches for the specified season and competition.}
}
\examples{
get.matches(username = "username", password = "password",
            season_id = "season_id", competition_id = "competition_id", version = "v1",
            baseurl = "https://data.statsbombservices.com/api/")
}
