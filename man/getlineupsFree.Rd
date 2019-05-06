\name{get.lineupsFree}
\alias{get.lineupsFree}
\title{
This function returns all lineups for the match requested. This is for use with the freely released data from StatsBomb.com.}
\description{
This function easily scrapes the free lineups available from StatsBomb.com. Most effectively, this function is used internally in the StatsBombFreeEvents() function in order to pull in all of the freely available StatsBomb Data.}
\usage{
get.lineupsFree(Match)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Match}{Data frame of the match you wish to pull the events for.}
}
\value{
  \item{df}{Returns a data frame with all lineups for this match available for free.}
}
\examples{
get.lineupsFree(Match)
}
