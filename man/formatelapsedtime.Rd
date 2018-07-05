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
  \item{dataframe}{Dataframe object gathered from the StatsBomb API.
}

}
\details{
}
\value{
\item{df}{Returns a data frame with all of the time information.}}
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
formatelapsedtime(dataframe)
\keyword{StatsBomb}% use one of  RShowDoc("KEYWORDS")
\keyword{Data}% __ONLY ONE__ keyword per line
\keyword{Match}% __ONLY ONE__ keyword per line
\keyword{Events}% __ONLY ONE__ keyword per line
\keyword{Time}% __ONLY ONE__ keyword per line

