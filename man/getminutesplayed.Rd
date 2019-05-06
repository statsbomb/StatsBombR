\name{get.minutesplayed}
\alias{get.minutesplayed}
\title{
This function returns the players from each match, the number of minutes played and the times of their substitution, if applicable.}
\description{
For use with the all StatsBomb data. After StatsBomb data is read in from the JSON file, this function will return a dataframe of all of the minutes played for each player in each match.}
\usage{
get.minutesplayed(events)
}
\arguments{
  \item{events}{Dataframe of event object gathered from the StatsBomb API, need the ElapsedTime variable from the formatelapsedtime.R function.}
}
\value{
\item{df}{Returns a data frame with all of the player minutes played information for each match.}
}
\examples{
events <- StatsBombFreeEvents()
events <- formatelapsedtime(events)
get.minutesplayed(events)
}
