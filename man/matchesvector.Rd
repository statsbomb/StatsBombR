\name{matchesvector}
\alias{matchesvector}
\title{
This function returns all matches from the specified season and competition.}
\description{
For use with the StatsBomb Data API credentials. This function is used to access the JSON file from the StatsBomb API and return the matches in vector form. For reference, the premier league has a competition id = 2 and 2018 is season_id = 1.}
\usage{
matchesvector(username = "username", password = "password",
                      season_id = "season_id", competition_id = "competition_id")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{username}{Character object of your StatsBomb API username.
}
\item{password}{Character object of your StatsBomb API password.
}
\item{season_id}{Character object of the season_id for the matches you wish to access.
}

\item{competition_id}{Character object of the competition_id for the match you wish to access.
}

}
\details{
}
\value{
\item{vector}{Returns a vector with all matches for the specified season and competition.}}
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
matchesvector(username = "username", password = "password",
                      season_id = "season_id", competition_id = "competition_id")
\keyword{StatsBomb}% use one of  RShowDoc("KEYWORDS")
\keyword{Data}% __ONLY ONE__ keyword per line
\keyword{Match}% __ONLY ONE__ keyword per line
\keyword{Matches}% __ONLY ONE__ keyword per line
