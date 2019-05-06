\name{get.matchFree}
\alias{get.matchFree}
\title{
This function returns all events for the match requested. This is for use with the freely released data from StatsBomb.com.}
\description{
This function easily scrapes the free events available from StatsBomb.com. Most effectively, this function is used internally in the StatsBombFreeEvents() function in order to pull in all of the freely available StatsBomb Data.}
\usage{
get.matchFree(Match)
}
\arguments{
\item{Match}{Character string of the match id you wish to pull data for.}
}
\value{
\item{dataframe}{Returns a data frame with all events for this match available for free.}
}
\examples{
get.matchFree(Match)
}
