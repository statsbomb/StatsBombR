\name{cleanlineups}
\alias{cleanlineups}
\title{
This function unnests all lineups and returns a cleaned data frame.}
\description{
Pull lineups first using the alllineups function, then unnest them quickly with the cleanlineups function.}
\usage{
cleanlineups(lineups)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{lineups}{A data frame of the lineups as accessed from the API and pulled using the alllineups function.}
}
\value{
\item{df}{Returns a data frame with all lineups unnested.}
}
\examples{
cleanlineups(lineups)
}
