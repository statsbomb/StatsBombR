\name{StatsBombFreeLineups}
\alias{StatsBombFreeLineups}
\title{
This function returns all lineups for the matches requested, or all matches available. This is for use with the freely released data from StatsBomb.com.}
\description{
This function easily scrapes the free events available from StatsBomb on our GitHub repository. Currently, parallel is only supported on PCs.}
\usage{
StatsBombFreeLineups(MatchesDF = "ALL", Parallel = T)
}
\arguments{
\item{MatchesDF}{Data frame of the matches you wish to pull for the lineups for. Or simply type "ALL" to return all free lineups available.}
\item{Parallel}{Boolean variable for whether or not you want the function to run in parallel.}
}
\value{
\item{df}{Returns a data frame with all events for the matches selected.}
}
\examples{
StatsBombFreeLineups(MatchesDF = "ALL", Parallel = T)
StatsBombFreeLineups(MatchesDF = Matches, Parallel = T) #Where Matches is a dataframe of the matches
}
