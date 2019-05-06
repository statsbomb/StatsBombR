\name{matchesvector}
\alias{matchesvector}
\title{
This function returns all matches from the specified season and competition.}
\description{
For use with the StatsBomb Data API credentials. This function is used to access the JSON file from the StatsBomb API and return the matches in vector form. For reference, the premier league has a competition id = 2 and 2018 is season_id = 1.}
\usage{
matchesvector(username = "username", password = "password",
                      season_id = "season_id", competition_id = "competition_id")
}
\arguments{
  \item{username}{Character object of your StatsBomb API username.}
  \item{password}{Character object of your StatsBomb API password.}
  \item{season_id}{Character object of the season_id for the matches you wish to access.}
  \item{competition_id}{Character object of the competition_id for the match you wish to access.}
}
\value{
\item{vector}{Returns a vector with all matches for the specified season and competition.}
}
\examples{
matches <- matchesvector(username = "username", password = "password",
                      season_id = "season_id", competition_id = "competition_id")
}
