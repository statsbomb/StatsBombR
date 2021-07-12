\name{team_season}
\alias{team_season}
\title{
This function returns aggregated metrics from the IQ API for all teams in a given league-season.}
\description{
For use with the StatsBomb Data API credentials. This function is used to access the JSON file from the StatsBomb IQ API and format it as a data frame (tibble) for use in R. Currently, parallel is only supported for windows.}
\usage{
team_season(username, password, competition_id, season_id)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{username}{Character object of your StatsBomb API username.}
  \item{password}{Character object of your StatsBomb API password.}
\item{competition_id}{The ID of the competition you wish to pull data for. Can be either a vector or just insert the number directly.}
\item{season_id}{The ID of the season you wish to pull data for. Can be either a vector or just insert the number directly.}
}

\value{
\item{df}{Returns a data frame with all the team metrics for the competitions and seasons specified.}
}
\examples{
pl2021_team_season <- team_season(username = username, password = password, 2, 90)
}
