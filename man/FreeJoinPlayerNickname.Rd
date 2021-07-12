\name{JoinPlayerNickName}
\alias{JoinPlayerNickName}
\title{
This function returns and joins player nick names from the free lineups API into the event data.}
\description{
This function joins player nicknames for players in the free matches available from StatsBomb.com.}
\usage{
FreeJoinPlayerNickname(events)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
\item{events}{Data frame of the event data that you want to join nicknames too. The match_ids must be present in the events data.}
}
\value{
\item{df}{Returns a data frame with all events and nicknames joined.}
}
\examples{
events <- FreeJoinPlayerNickname(events)
}
