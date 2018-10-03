\name{getOpposingTeam}
\alias{getOpposingTeam}
\title{
This function joins the opposing team in each match to all events in the data frame.}
\description{
For use with StatsBomb Data API credentials. This function takes a data frame of events and returns the opposing team for each event. The events data frame must include at least one event from each team per game.}
\usage{
getOpposingTeam(events)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{events}{Dataframe object gathered from the StatsBomb API.
}

}
\details{
}
\value{
\item{df}{Returns a data frame with the opposing team added as a variable.}}
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
getOpposingTeam(events)
\keyword{StatsBomb}% use one of  RShowDoc("KEYWORDS")
\keyword{Data}% __ONLY ONE__ keyword per line
\keyword{Match}% __ONLY ONE__ keyword per line
\keyword{Events}% __ONLY ONE__ keyword per line
\keyword{Shots}% __ONLY ONE__ keyword per line
