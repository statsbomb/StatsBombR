\name{allclean}
\alias{allclean}
\title{
Returns a data frame with all of the original data frame all cleaned for R with extra information added.}
\description{
For use with the StatsBomb Data API credentials. After StatsBomb data is read in from the API, JSON file, this function will return a data frame with all formatted for R with extra information added. Note that with all of the different cleaning functions provided for internal use in this package as well as for use individually externally, this function will clean all the data in the proper order that they are meant for.}
\usage{
allclean(dataframe)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{dataframe}{Dataframe object gathered from the StatsBomb API.
}

}
\value{
\item{df}{Returns a data frame with all of the original data frame all cleaned for R with extra information added.}
}
\examples{
allclean(dataframe)
}
