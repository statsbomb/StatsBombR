\name{getpositioncategory}
\alias{getpositioncategory}
\title{
This function returns the players' id and 1 of 6 position categories based on when they play in each most often.}
\description{
For use with the all StatsBomb data. After StatsBomb data is read in from the JSON file, this function will return a dataframe of all of the player ids and their position category.}
\usage{
get.positioncategory(events)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{events}{Dataframe of event object gathered from the StatsBomb API, need the position.name and the player ids for all events.
}

}
\details{
}
\value{
\item{df}{Returns a data frame with all of the player ids and position categories.}
}
\references{
%% ~put references to the literature/web site here ~
}
\author{

}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
events <- StatsBombFreeEvents()
positions <- get.positioncategory(events)
}
