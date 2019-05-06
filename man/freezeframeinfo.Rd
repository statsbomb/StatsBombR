\name{freezeframeinfo}
\alias{freezeframeinfo}
\title{
This function returns the defensive information from the shot freeze frame variable.}
\description{
For use with the StatsBomb Data API credentials. After StatsBomb data is read in from the API, JSON file, this function will pull all of the defensive and attacking information from the freeze frames.}
\usage{
freezeframeinfo(dataframe)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dataframe}{Dataframe object gathered from the StatsBomb API.}
}
\value{
\item{df}{Returns a data frame with extra information calculated from the freeze frames.}
}
\examples{
allevents <- freezeframeinfo(allevents)
}
