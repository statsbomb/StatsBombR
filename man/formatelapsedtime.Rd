\name{formatelapsedtime}
\alias{formatelapsedtime}
\title{
This function uses the timestamp and period information to create an elapsed time from the beginning of the match variable.}
\description{
For use with the StatsBomb Data API credentials. After StatsBomb data is read in from the API, JSON file, this function uses the timestamp and period information to create an elapsed time from the beginning of the match variable.}
\usage{
formatelapsedtime(dataframe)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dataframe}{Dataframe object gathered from the StatsBomb API.}
}

\value{
\item{df}{Returns a data frame with all of the time information. Elapsed Time presented as time from thestart of the match in seconds.}
}
\examples{
formatelapsedtime(dataframe)
}
