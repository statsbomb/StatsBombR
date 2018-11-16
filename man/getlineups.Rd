\name{get.lineups}
\alias{get.lineups}
\title{
This function returns all lineups for the match specified in the arguments.}
\description{
For use with the StatsBomb Data API credentials. This function is used to access the JSON file from the StatsBomb API and format it as a data frame (tibble) for use in R.}
\usage{
get.lineups(username = "username", password = "password", match_id = "match_id")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{username}{Character object of your StatsBomb API username.
}
\item{password}{Character object of your StatsBomb API password.
}
\item{match_id}{Character object of the match_id for the match you wish to access.
}

}
\details{
}
\value{
\item{df}{Returns a data frame with all events for the match specified.}}
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
get.lineups(username = username, password = password, matches.epl$match_id[1])
\keyword{StatsBomb}% use one of  RShowDoc("KEYWORDS")
\keyword{Data}% __ONLY ONE__ keyword per line
\keyword{Match}% __ONLY ONE__ keyword per line
\keyword{Lineups}% __ONLY ONE__ keyword per line
