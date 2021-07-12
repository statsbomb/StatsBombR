\name{player_all_matches}
\alias{player_all_matches}
\title{
This function returns match-by-match metrics from the IQ API for all players in a given league-season. Different to player_season, which pulls per 90 aggregated metrics.}
\description{
For use with the StatsBomb Data API credentials. This function is used to access the JSON file from the StatsBomb IQ API and format it as a data frame (tibble) for use in R. Currently, parallel is only supported for windows.}
\usage{
player_all_matches(username, password, matches)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{username}{Character object of your StatsBomb API username.}
  \item{password}{Character object of your StatsBomb API password.}
\item{matches}{Character vector of the matches you wish to access.}
}

\value{
\item{df}{Returns a data frame with all the per-match player metrics for the matches specified.}
}
\examples{
matchids <- matchesvector(username, password, 90, 2)
pl_2021_player_match <- player_all_matches(username, password, matchids)
}
