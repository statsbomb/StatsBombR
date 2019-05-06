\name{get.opposingteam}
\alias{get.opposingteam}
\title{
This function joins the opposing team in each match to all events in the data frame.}
\description{
For use with StatsBomb Data API credentials. This function takes a data frame of events and returns the opposing team for each event. The events data frame must include at least one event from each team per game.}
\usage{
get.opposingteam(events)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{events}{Dataframe object gathered from the StatsBomb API.}
}

\value{
\item{df}{Returns a data frame with the opposing team added as a variable.}
}
\examples{
events <- get.opposingteam(events)
}
