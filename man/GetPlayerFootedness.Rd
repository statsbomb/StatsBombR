\name{get.playerfootedness}
\alias{get.playerfootedness}
\title{
This function returns defines a player's footedness based on the percent of time they use each foot.}
\description{
For use with the StatsBomb Data API credentials. This function is used to access the JSON file from the StatsBomb API and format it as a data frame (tibble) for use in R. This function returns defines a player's footedness based on the percent of time they use each foot.}
\usage{
get.playerfootedness(Passes)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
\item{Passes}{Data frame with passes, pass body part name and player name and id.}
}
\value{
\item{df}{Data frame of the percent of time each player uses each foot, and their dominant foot defined by the greater percent.}
}
\examples{
get.playerfootedness(Passes)
}
