\name{get.matchFree}
\alias{get.matchFree}
\title{
This function returns all events for the match requested. This is for use with the freely released data from StatsBomb.com.}
\description{
This function easily scrapes the free events available from StatsBomb.com. Most effectively, this function is used internally in the StatsBombFreeEvents() function in order to pull in all of the freely available StatsBomb Data.}
\usage{
get.matchFree(Match)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
\item{Match}{Data frame of the match you wish to pull the events for.
}
\details{
}
\value{
\item{df}{Returns a data frame with all events for this match available for free.}}
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
matchFree(Match)

\keyword{StatsBomb}% use one of  RShowDoc("KEYWORDS")
\keyword{Data}% __ONLY ONE__ keyword per line
\keyword{Events}% __ONLY ONE__ keyword per line
\keyword{Free}% __ONLY ONE__ keyword per line
\keyword{Match}% __ONLY ONE__ keyword per line
