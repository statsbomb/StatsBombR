\name{annotate_pitchSB}
\title{
This function returns field markings in ggplot. This is adapted from the ggsoccer package to fit StatsBomb Data.}
\description{
This function puts the field mappings onto the graphics in specification with StatsBomb data.}
\usage{
ggplot(StatsBombData, aes(location.x, location.y)) +
 annotate_pitchSB()
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
 annotate_pitchSB()
}
