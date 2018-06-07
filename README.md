# StatsBombR

#### By: StatsBomb

#### Support: support@statsbombservices.com

This repository is an R package to easily stream StatsBomb data into R using your log in credentials for the API or free data from our GitHub page.

This package offers a parallel option to most computationally expensive functions. However, it is currently only supported on Windows.

#Free Data Instructions:

Welcome to the Free Data Offerings from StatsBomb Services. 

This package is reading in the open access dat found on [https://github.com/statsbomb/open-data](https://github.com/statsbomb/open-data). Below you will find a list of the functions used to quickly read in all open data currently available. Check back often as new data is regularly added.

####To read in all events available:

`StatsBombData <- StatsBombFreeEvents()`

#####To read in all of the competitions we offer simply run:

`FreeCompetitions()`

or, for use in other functions, store it as a data frame object:

`Comp <- FreeCompetitions()`

####To read in the matches available:

`Matches <- FreeMatches(Comp$competition_id)`

####To read in events for a certain game:

`get.matchFree(Matches[1,])` 

It is important to note, that the argument here is the entire row returns from "FreeMatches", this is because there is information from each match observation that is needed in the `get.matchFree` function.

#API Data Access Instructions:

####To read in just one game, simply run: 

1. `StatsBombData <- getmatch(username, password, match_id, season_id, competition_id)`

####To read multiple games, run:

1. `matches <- matchesvector(username, password, season_id, competition_id)`
2. `StatsBombData <- allmatches(username, password, matches, season_id, competition_id, parallel = T)`

#Data Cleaning Helpers:

Although JSON files can often be a pain to clean, especially due to nested data frames, these helper functions may make your data wrangling much easier.

#Final Notes:

- As always, check out the Rdocumentation for each function (ex. `?StatsBombFreeEvents()`) for more specific description
