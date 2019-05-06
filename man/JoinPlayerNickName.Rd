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
\item{username}{Character string of your StatsBomb API username.}
\item{password}{Character string of your StatsBomb API password.}
\item{events}{Data frame of the event data that you want to join nick names too. The match_ids must be present in the events data.}
}
\value{
\item{df}{Returns a data frame with all events and nicknames joined.}
}
\examples{
events <- JoinPlayerNickName(username = username, password = password, events)
}
