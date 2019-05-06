\name{possessioninfo}
\alias{possessioninfo}
\title{
Returns a data frame with all of the original data frame all cleaned for R with extra information added.}
\description{
For use with the StatsBomb Data API credentials. After StatsBomb data is read in from the API, JSON file, this function will return a data frame all formatted for R with extra information about the current posssession in the game added.}
\usage{
possessioninfo(dataframe)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dataframe}{Dataframe object gathered from the StatsBomb API.}
}
\value{
\item{df}{Returns a data frame with all of the original data frame all cleaned for R with extra information added.}
}
\examples{
possessioninfo(dataframe)
}
