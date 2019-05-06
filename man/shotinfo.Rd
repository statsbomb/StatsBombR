\name{shotinfo}
\alias{shotinfo}
\title{
This function returns extra shot information.}
\description{
For use with StatsBomb Data. After StatsBomb data is read in from the API, JSON file, this function will add new shot information variables.}
\usage{
shotinfo(dataframe)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dataframe}{Dataframe object gathered from the StatsBomb API.}
}
\value{
\item{df}{Returns a data frame with all of the goalkeeper information.}
}
\examples{
shotinfo(dataframe)
}
