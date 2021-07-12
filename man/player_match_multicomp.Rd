\name{player_match_multicomp}
\alias{player_match_multicomp}
\title{
This function returns match-by-match metrics from the IQ API for all players across multiple leagues and/or seasons.}
\description{
For use with the StatsBomb Data API credentials. This function is used to access the JSON file from the StatsBomb IQ API and format it as a data frame (tibble) for use in R. Currently, parallel is only supported for windows.}
\usage{
player_match_multicomp(username = "username", password = "password",
                competitionmatrix, version = "v1",
                baseurl = "https://data.statsbombservices.com/api/", parallel = TRUE, cores = detectCores())}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{username}{Character object of your StatsBomb API username.}
  \item{password}{Character object of your StatsBomb API password.}
\item{competitionmatrix}{Matrix of the competition and season ids you want the events for. Competition ID in the first column and Season ID in the second column.}
\item{version}{Character string of the version of the StatsBomb API you wish to access. Currently version v1, v2, v3, v4 and v5 are supported.}
}

\value{
\item{df}{Returns a data frame with all the per-match player metrics for the seasons and competitions specified.}
}
\examples{
comps <- competitions(username, password)
competitionmatrix = comps[,c(1,2,4,6)]
competitionmatrix <- competitionmatrix %>%
  filter(competition_name=="Serie A" | competition_name=="La Liga") %>%
  filter(season_name=="2020/2021"  ) 
 sbdata <-  player_match_multicomp(username = "insert_your_username", password = "insert_your_password",
                         competitionmatrix, version = "v5",
                         baseurl = "https://data.statsbombservices.com/api/", parallel = TRUE, cores = detectCores()) 
}
