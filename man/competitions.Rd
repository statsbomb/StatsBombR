\name{competitions}
\alias{competitions}
\title{
This function returns all competitions that StatsBomb has data for.}
\description{
This function easily scrapes the competitions available from the StatsBomb API.}
\usage{
competitions(username, password)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{username}{Character string of your StatsBomb API username.
}
\item{password}{Character string of your StatsBomb API password.
}
\item{version}{Character string of the version of the StatsBomb API you wish to access. Currently version v1 and v2 are supported.
}

}
\details{
}
\value{
\item{df}{Returns a data frame with all competitions available.}}
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
competitions(username, password)

\keyword{StatsBomb}% use one of  RShowDoc("KEYWORDS")
\keyword{Data}% __ONLY ONE__ keyword per line
\keyword{Competitions}% __ONLY ONE__ keyword per line
\keyword{API}% __ONLY ONE__ keyword per line
