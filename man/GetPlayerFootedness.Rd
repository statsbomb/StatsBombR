\name{GetPlayerFootedness}
\alias{GetPlayerFootedness}
\title{
This function returns defines a player's footedness based on the percent of time they use each foot.}
\description{
For use with the StatsBomb Data API credentials. This function is used to access the JSON file from the StatsBomb API and format it as a data frame (tibble) for use in R. This function returns defines a player's footedness based on the percent of time they use each foot.}
\usage{
GetPlayerFootedness(Passes)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
\item{Passes}{Data frame with passes, pass body part name and player name and id.
}
\details{
}
\value{
\item{df}{Data frame of the percent of time each player uses each foot, and their dominant foot defined by the greater percent.}}
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
GetPlayerFootedness(Passes)
\keyword{StatsBomb}% use one of  RShowDoc("KEYWORDS")
\keyword{Data}% __ONLY ONE__ keyword per line
\keyword{Passes}% __ONLY ONE__ keyword per line
\keyword{Footedness}% __ONLY ONE__ keyword per line
