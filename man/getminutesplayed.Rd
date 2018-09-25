\name{getminutesplayed}
\alias{getminutesplayed}
\title{
This function returns the players from each match, the number of minutes played and the times of their substitution, if applicable.}
\description{
For use with the all StatsBomb data. After StatsBomb data is read in from the JSON file, this function will return a dataframe of all of the minutes played for each player in each match.}
\usage{
get.minutesplayed(events)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{events}{Dataframe of event object gathered from the StatsBomb API.
}

}
\details{
}
\value{
\item{df}{Returns a data frame with all of the player minute information.}}
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Function was written by @FCRstats
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
events <- StatsBombFreeEvents()
get.minutesplayed(events)
\keyword{StatsBomb}% use one of  RShowDoc("KEYWORDS")
\keyword{Data}% __ONLY ONE__ keyword per line
\keyword{Match}% __ONLY ONE__ keyword per line
\keyword{Events}% __ONLY ONE__ keyword per line
\keyword{Lineups}% __ONLY ONE__ keyword per line
\keyword{Minutes}% __ONLY ONE__ keyword per line

