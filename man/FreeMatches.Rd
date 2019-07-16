\name{FreeMatches}
\alias{FreeMatches}
\title{
This function returns all free matches that are released as free data from StatsBomb.com.}
\description{
This function easily scrapes the free matches available from StatsBomb.com. Most effectively, this function is used internally in the StatsBombFreeEvents() function in order to pull in all of the freely available StatsBomb Data. }
\usage{
FreeMatches(FreeCompetitions())
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Competitions}{A competition data frame as returned by FreeCompetitions
    for which you want to retrieve matches.}
}
\value{
\item{df}{Returns a data frame with all matches available for free.}
}
\examples{
FreeMatches(FreeCompetitions())
}
