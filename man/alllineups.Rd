\name{alllineups}
\alias{alllineups}
\title{
This function returns all lineups from the matches specified in the arguments.}
\description{
For use with the StatsBomb Data API credentials. This function is used to access the JSON file from the StatsBomb API and format it as a data frame (tibble) for use in R. Currently, this function only supports one season and one competition at a time. This function can simply be run multiple times for different seasons and competitions and then bound together. Currently, parallel is only supported for windows.}
\usage{
alllineups(username = "username", password = "password", matches$match_id, version = "v1",
                        baseurl = "https://data.statsbombservices.com/api/", parallel = T)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{username}{Character object of your StatsBomb API username.}
  \item{password}{Character object of your StatsBomb API password.}
  \item{match_id}{Character vector of the matches you wish to access.}
  \item{Parallel}{Boolean variable for whether or not you want to gather in parallel (much faster).}
  \item{version}{Character string of the version of the StatsBomb API you wish to access. Currently version v1, v2, v3 and v4 are supported.}
}
\value{
\item{df}{Returns a data frame with all lineups for the matches specified.}
}
\examples{
lineups <- alllineups(username = username, password = password, matches.epl$match_id, parallel = T)
}
