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
  \item{theme}{A ggplot theme layer.}
}
\value{
\item{theme}{A ggplot theme layer.}
}
\examples{
ggplot(StatsBombData, aes(location.x, location.y)) +
 theme_SB()
}
