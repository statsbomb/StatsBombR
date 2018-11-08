\name{annotate_pitchSB}
\title{
This function returns field markings in ggplot. This is adapted from the ggsoccer package to fit StatsBomb Data.}
\description{
After StatsBomb data is read in from the API, JSON file, this function put the field mappings onto the graphics .}
\usage{
ggplot(StatsBombData, aes(location.x, location.y)) +
 annotate_pitchSB()
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{theme}{A ggplot theme layer.
}

}
\details{
}
\value{
\item{theme}{A ggplot theme layer.}}
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
ggplot(StatsBombData, aes(location.x, location.y)) +
 annotate_pitchSB()

\keyword{StatsBomb}% use one of  RShowDoc("KEYWORDS")
\keyword{Data}% __ONLY ONE__ keyword per line
\keyword{ggplot2}% __ONLY ONE__ keyword per line
\keyword{Events}% __ONLY ONE__ keyword per line
\keyword{pitch}% __ONLY ONE__ keyword per line
