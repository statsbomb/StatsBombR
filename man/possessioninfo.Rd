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
  \item{dataframe}{Dataframe object gathered from the StatsBomb API.
}

}
\details{
}
\value{
\item{df}{Returns a data frame with all of the original data frame all cleaned for R with extra information added.}
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
allclean(dataframe)
\keyword{StatsBomb}% use one of  RShowDoc("KEYWORDS")
\keyword{Data}% __ONLY ONE__ keyword per line
\keyword{Match}% __ONLY ONE__ keyword per line
\keyword{Events}% __ONLY ONE__ keyword per line
\keyword{Clean}% __ONLY ONE__ keyword per line
\keyword{Possession}% __ONLY ONE__ keyword per line

