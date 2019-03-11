\name{JoinPlayerNickName}
\alias{JoinPlayerNickName}
\title{
This function returns joins player nick names from the lineups API into the event data.}
\description{
For use with the StatsBomb Data API credentials. This function is used to access the JSON file from the StatsBomb API and format it as a data frame (tibble) for use in R.}
\usage{
JoinPlayerNickName(username = "username", password = "password", events)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
\item{username}{Character string of your StatsBomb API username.
}
\item{password}{Character string of your StatsBomb API password.
}
\item{events}{Data frame of the event data that you want to join nick names too. The match_ids must be present in the events data.
}

\details{
}
\value{
\item{df}{Returns a data frame with all events and nicknames joined.}}
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
JoinPlayerNickName(username = username, password = password, events)
\keyword{StatsBomb}% use one of  RShowDoc("KEYWORDS")
\keyword{Data}% __ONLY ONE__ keyword per line
\keyword{Names}% __ONLY ONE__ keyword per line
\keyword{Events}% __ONLY ONE__ keyword per line
