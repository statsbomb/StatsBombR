\name{cleanlocations}
\alias{cleanlocations}
\title{
This function cleans all of the location variables in a StatsBomb data frame.}
\description{
For use with the StatsBomb Data API credentials. After StatsBomb data is read in from the API, JSON file, this function will clean all of the location variables.}
\usage{
cleanlocations(dataframe)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dataframe}{Dataframe object gathered from the StatsBomb API.
}

}
\value{
\item{df}{Returns a data frame with all locations cleaned.}
}
\examples{
cleanlocations(dataframe)
}
