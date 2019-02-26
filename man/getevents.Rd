\name{getmatch}
\alias{getmatch}
\title{
This function returns all events for the match specified in the arguments.}
\description{
For use with the StatsBomb Data API credentials. This function is used to access the JSON file from the StatsBomb API and format it as a data frame (tibble) for use in R.}
\usage{
get.events(username = "username", password = "password", match_id = "match_id", version = "v1",
                      baseurl = "https://data.statsbombservices.com/api/")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{username}{Character string of your StatsBomb API username.
}
\item{password}{Character string of your StatsBomb API password.
}
\item{match_id}{Character string of the match_id for the match you wish to access.
}

\item{version}{Character string of the version of the StatsBomb API you wish to access. Currently version v1 and v2 are supported.
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
get.eventsusername = username, password = password, 14409)
\keyword{StatsBomb}% use one of  RShowDoc("KEYWORDS")
\keyword{Data}% __ONLY ONE__ keyword per line
\keyword{Match}% __ONLY ONE__ keyword per line
\keyword{Events}% __ONLY ONE__ keyword per line
