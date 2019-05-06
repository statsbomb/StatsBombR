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
  \item{dataframe}{A dataframe with all events from a match.}
}
\value{
\item{list}{List of two data frames. The first element of the list is the original dataframe with new variables created defining the game state and current score for each team, and the second element of the list is a data frame of the time each team has spent winning, losing and drawing.}
}
\examples{
  ##Returns a list
  temp <- get.gamestate(AllEvents)
  AllEvents <- temp[1][[1]]
  GameStates <- temp[2][[1]]
}
