\name{allmatches}
\alias{allmatches}
\title{
This function returns all events from the matchs specified in the arguments.}
\description{
For use with the StatsBomb Data API credentials. This function is used to access the JSON file from the StatsBomb API and format it as a data frame (tibble) for use in R. Currently, this function only supports one season and one competition at a time. This function can simply be run multiple times for different seasons and competitions and then bound together. Currently, parallel is only supported for windows.}
\usage{
allmatches(username = "username", password = "password",
                      matches$match_id, season_id = "season_id", competition_id = "competition_id", parallel = T)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{username}{Character object of your StatsBomb API username.
}
\item{password}{Character object of your StatsBomb API password.
}
\item{match_id}{Character vector of the matches you wish to access.
}

\item{season_id}{Character object of the season_id for the matches you wish to access.
}

\item{competition_id}{Character object of the competition_id for the match you wish to access.
}
\item{Parallel}{Boolean variable for whether or not you want to gather in parallel (much faster).
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
allmatches(username = username, password = password,
                      matches.epl$match_id, season_id, competition_id, parallel = T)
\keyword{StatsBomb}% use one of  RShowDoc("KEYWORDS")
\keyword{Data}% __ONLY ONE__ keyword per line
\keyword{Match}% __ONLY ONE__ keyword per line
\keyword{Events}% __ONLY ONE__ keyword per line
