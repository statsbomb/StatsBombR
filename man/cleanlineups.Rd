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
  \item{lineups}{A data frame of the lineups as accessed from the API and pulled using the alllineups function.
}
}
\details{
}
\value{
\item{df}{Returns a data frame with all lineups unnested.}}
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
cleanlineups(lineups)
\keyword{StatsBomb}% use one of  RShowDoc("KEYWORDS")
\keyword{Data}% __ONLY ONE__ keyword per line
\keyword{Match}% __ONLY ONE__ keyword per line
\keyword{Lineups}% __ONLY ONE__ keyword per line
