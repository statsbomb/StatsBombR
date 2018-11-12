\name{MultiCompMatches}
\alias{MultiCompMatches}
\title{
This function returns all matches from the competitions and seasons specified in the arguments.}
\description{
For use with the StatsBomb Data API credentials. This function is used to access the JSON file from the StatsBomb API and format it as a data frame (tibble) for use in R. This function supports multiple competitions and seasons simultaneously. Currently, parallel is only supported for windows.}
\usage{
MultiCompMatches(username = "username", password = "password",
                competitionmatrix)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{username}{Character object of your StatsBomb API username.
}
  \item{password}{Character object of your StatsBomb API password.
}
\item{competitionmatrix}{Matrix of the competition and season ids you want the match information for. Competition ID in the first column and Season ID in the second column.
}
}
\details{
}
\value{
\item{df}{Returns a data frame with all events for the events and seasons specified.}}
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
##Pull Competitions From the API
comps <- competitions(username, password)
##Filter for the competitions you want
EuropeComps <- comps %>% filter(country_name == "Europe")
##Create a matrix of the competition and season ids
competitionmatrix <- as.matrix(EuropeComps[,1:2])
##Pull all of the events.
Matches <- MultiCompMatches(username, password, competitionmatrix)

\keyword{StatsBomb}% use one of  RShowDoc("KEYWORDS")
\keyword{Data}% __ONLY ONE__ keyword per line
\keyword{Competition}% __ONLY ONE__ keyword per line
\keyword{Matches}% __ONLY ONE__ keyword per line
