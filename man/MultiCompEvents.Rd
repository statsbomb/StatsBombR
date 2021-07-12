\name{MultiCompEvents}
\alias{MultiCompEvents}
\title{
This function returns all events from the competitions and seasons specified in the arguments.}
\description{
For use with the StatsBomb Data API credentials. This function is used to access the JSON file from the StatsBomb API and format it as a data frame (tibble) for use in R. This function supports multiple competitions and seasons simultaneously. Currently, parallel is only supported for windows.}
\usage{
MultiCompEvents(username = "username", password = "password",
                competitionmatrix, version = "v1",
                baseurl = "https://data.statsbombservices.com/api/", parallel = TRUE, cores = detectCores())
}
\arguments{
  \item{username}{Character object of your StatsBomb API username.}
  \item{password}{Character object of your StatsBomb API password.}
  \item{competitionmatrix}{Matrix of the competition and season ids you want the events for. Competition ID in the first column and Season ID in the second column.}
  \item{version}{Character string of the version of the StatsBomb API you wish to access. Currently version v1, v2, v3, v4 and v5 are supported.}
}
\value{
\item{df}{Returns a data frame with all events for the events and seasons specified.}
}
\examples{
##Pull Competitions From the API
comps <- competitions(username, password)
##Filter for the competitions you want
EuropeComps <- comps %>% filter(country_name == "Europe")
##Create a matrix of the competition and season ids
competitionmatrix <- as.matrix(EuropeComps[,1:2])
##Pull all of the events.
Events <- MultiCompEvents(username, password, competitionmatrix)
}
