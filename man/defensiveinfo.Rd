\name{defensiveinfo}
\alias{defensiveinfo}
\title{
This function returns the defensive information from the shot freeze frame variable.}
\description{
For use with the StatsBomb Data API credentials. After StatsBomb data is read in from the API, JSON file, this function will pull all of the defensive information from the freeze frames.}
\usage{
defensiveinfo(dataframe)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dataframe}{Dataframe object gathered from the StatsBomb API.}
}
\value{
\item{df}{Returns a data frame with all of the goalkeeper information.}
}
\examples{
defensiveinfo(dataframe)
}
