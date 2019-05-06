\name{get.lineups}
\alias{get.lineups}
\title{
This function returns all lineups for the match specified in the arguments.}
\description{
For use with the StatsBomb Data API credentials. This function is used to access the JSON file from the StatsBomb API and format it as a data frame (tibble) for use in R.}
\usage{
get.lineups(username = "username", password = "password", match_id = "match_id", version = "v1",
baseurl = "https://data.statsbombservices.com/api/")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{username}{Character string of your StatsBomb API username.}
  \item{password}{Character string of your StatsBomb API password.}
  \item{match_id}{Character/integer string of the match_id for the match you wish to access.}
  \item{version}{Character string of the version of the StatsBomb API you wish to access. Currently version v1, v2, v3 and v4 are supported.}
}
\value{
\item{df}{Returns a data frame with all events for the match specified.}
}
\examples{
get.lineups(username = username, password = password, matches.epl$match_id[1])
}
