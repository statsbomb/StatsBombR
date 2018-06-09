\name{StatsBombFreeLineups}
\alias{StatsBombFreeLineups}
\title{
This function returns all lineups for the matches requested, or all matches available. This is for use with the freely released data from StatsBomb.com.}
\description{
This function easily scrapes the free events available from StatsBomb on our GitHub repository. Currently, parallel is only supported on PCs.}
\usage{
StatsBombFreeLineups(MatchesDF = "ALL", Parallel = T)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
\item{MatchesDF}{Data frame of the matches you wish to pull for the lineups for. Or simply type "ALL" to return all free lineups available.}
\item{Parallel}{Boolean variable for whether or not you want the function to run in parallel.}
\details{
}
\value{
\item{df}{Returns a data frame with all events for the matches selected.}}
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
StatsBombFreeLineups(MatchesDF = "ALL", Parallel = T)
StatsBombFreeLineups(MatchesDF = Matches, Parallel = T) #Where Matches is a dataframe of the matches

\keyword{StatsBomb}% use one of  RShowDoc("KEYWORDS")
\keyword{Data}% __ONLY ONE__ keyword per line
\keyword{Lineups}% __ONLY ONE__ keyword per line
\keyword{Free}% __ONLY ONE__ keyword per line
\keyword{Matches}% __ONLY ONE__ keyword per line
