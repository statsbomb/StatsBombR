\name{theme_SB}
\alias{theme_SB}
\title{
This function returns the theme consistent with reports written by StatsBomb.}
\description{
This theme is only functional in ggplot2 at the moment. But simply adding the theme at the end of your ggplot object will format your plot in the theme of StatsBomb}
\usage{
ggplot(StatsBombData, aes(location.x, location.y)) +
 theme_SB()
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
 theme_SB()

\keyword{StatsBomb}% use one of  RShowDoc("KEYWORDS")
\keyword{Data}% __ONLY ONE__ keyword per line
\keyword{ggplot2}% __ONLY ONE__ keyword per line
\keyword{Events}% __ONLY ONE__ keyword per line
\keyword{Theme}% __ONLY ONE__ keyword per line
