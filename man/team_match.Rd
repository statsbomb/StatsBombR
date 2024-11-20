\name{team_match}
\alias{team_match}
\title{
This function returns metrics from the IQ API for all teams in a given match.}
\description{
For use with the StatsBomb Data API credentials. This function is used to access the JSON file from the StatsBomb IQ API and format it as a data frame (tibble) for use in R. Currently, parallel is only supported for windows.}
\usage{
team_match(username, password, match_id)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{username}{Character object of your StatsBomb API username.}
  \item{password}{Character object of your StatsBomb API password.}
\item{match_id}{The ID of the match you wish to pull data for. Can be either a vector or just insert the number directly.}
}

\value{
\item{df}{Returns a data frame with all the team metrics for the match specified.}
}
\examples{
team_match_data <- team_match(username, password, 7298)
}
