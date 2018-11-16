\name{MultiMatchLineupsClean}
\alias{MultiMatchLineupsClean}
\title{
This function returns all lineups from the matches specified in the arguments and flattens the nested data frames.}
\description{
For use with the StatsBomb Data API credentials. This function is used to access the JSON file from the StatsBomb API and format it as a data frame (tibble) for use in R. This function returns all lineups for the matches specified and flattens the nested data frames into one clean data frame. Currently, parallel is only supported for windows.}
\usage{
MultiMatchLineupsClean(username = "username", password = "password", matches$match_id, parallel = T)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{username}{Character object of your StatsBomb API username.
}
\item{password}{Character object of your StatsBomb API password.
}
\item{match_id}{Character vector of the matches you wish to access.
}
\item{Parallel}{Boolean variable for whether or not you want to gather in parallel (much faster).
}

}
\details{
}
\value{
\item{df}{Returns a data frame with all lineups for the matches specified.}}
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
MultiMatchLineupsClean(username = username, password = password, matches.epl$match_id, parallel = T)
\keyword{StatsBomb}% use one of  RShowDoc("KEYWORDS")
\keyword{Data}% __ONLY ONE__ keyword per line
\keyword{Match}% __ONLY ONE__ keyword per line
\keyword{Lineups}% __ONLY ONE__ keyword per line
