\name{getgamestate}
\alias{get.gamestate}
\title{
This function returns additional variables for the game state, score and opposing score. It also returns a dataframe of the time each team spent winning.}
\description{
For use with the StatsBomb Data API credentials. After StatsBomb data is read in from the API, JSON file, this function will pull define the game state at the time of each event. It is often important for analysis to see how much time each team spends in each state. Therefore, we return a dataframe of the time each team is winning within each game as well.}
\usage{
get.gamestate(dataframe)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{datafrane}{A dataframe with all events from a match.
}

}
\details{
}
\value{
\item{list}{List of two data frames. The first element of the list is a data frame is the original dataframe passed into it, and the second element of the list is a data frame is the time each team has spent winning.}}
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
  ##Returns a list
  temp <- get.gamestate(AllEvents)
  AllEvents <- temp[1][[1]]
  GameStates <- temp[2][[1]]

\keyword{StatsBomb}% use one of  RShowDoc("KEYWORDS")
\keyword{Data}% __ONLY ONE__ keyword per line
\keyword{Match}% __ONLY ONE__ keyword per line
\keyword{Events}% __ONLY ONE__ keyword per line
\keyword{Score}% __ONLY ONE__ keyword per line
