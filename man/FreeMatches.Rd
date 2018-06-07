\name{FreeMatches}
\alias{FreeMatches}
\title{
This function returns all free matches that are released as free data from StatsBomb.com.}
\description{
This function easily scrapes the free matches available from StatsBomb.com. Most effectively, this function is used internally in the StatsBombFreeEvents() function in order to pull in all of the freely available StatsBomb Data. }
\usage{
FreeMatches(FreeCompetitions()$competition_id)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{Competitions}{Vector of the competitons IDs you wish to pull the match information for.
}

}
\details{
}
\value{
\item{df}{Returns a data frame with all matches available for free.}}
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
FreeMatches(FreeCompetitions()$competition_id)

\keyword{StatsBomb}% use one of  RShowDoc("KEYWORDS")
\keyword{Data}% __ONLY ONE__ keyword per line
\keyword{Matches}% __ONLY ONE__ keyword per line
\keyword{Free}% __ONLY ONE__ keyword per line
