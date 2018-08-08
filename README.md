# StatsBombR

#### By: StatsBomb

#### Support: support@statsbombservices.com

#### Updated August 8, 2018 many time expensive functions speed up.

This repository is an R package to easily stream StatsBomb data into R using your log in credentials for the API or free data from our GitHub page. **API access is for paying customers only**

This package offers a parallel option to most computationally expensive functions. However, it is currently only supported on Windows.

# Installation Instructions:

1. If not yet installed into R, run: `install.packages("devtools")`
2. Then, install this R package as: `devtools::install_github("statsbomb/StatsBombR")`
3. Finally, `library(StatsBombR)`

This package depends on several other packages in order for all functions to run. Therefore, if you have problems with any functions or with installing the package, it is likely due to package dependencies.

# Free Data Instructions:

Welcome to the Free Data Offerings from StatsBomb Services. 

This package is reading in the open access dat found on [https://github.com/statsbomb/open-data](https://github.com/statsbomb/open-data). Below you will find a list of the functions used to quickly read in all open data currently available. Check back often as new data is regularly added.

## Free Data Description and Privacy Policy

StatsBomb are committed to sharing new data and research publicly to enhance understanding of the game of Football. We want to actively encourage new research and analysis at all levels. Therefore we have made certain leagues of StatsBomb Data freely available for public use for research projects and genuine interest in football analytics. 

StatsBomb are hoping that by making data freely available, we will extend the wider football analytics community and attract new talent to the industry. We would like to collect some basic personal information about users of our data. By [giving us your email address](https://statsbomb.com/resource-centre/), it means we will let you know when we make more data, tutorials and research available. We will store the information in accordance with our Privacy Policy and the GDPR. 

Whilst we are keen to share data and facilitate research, we also urge you to be responsible with the data. Please register your details on https://www.statsbomb.com/resource-centre and read our [User Agreement](LICENSE.pdf) carefully.


#### Terms & Conditions

By using this repository, you are agreeing to the user agreement.

If you publish, share or distribute any research, analysis or insights based on this data, please state the data source as StatsBomb and use our logo.

#### To read in all events available:

`StatsBombData <- StatsBombFreeEvents()`

##### To read in all of the competitions we offer simply run:

`FreeCompetitions()`

or, for use in other functions, store it as a data frame object:

`Comp <- FreeCompetitions()`

#### To read in the matches available:

`Matches <- FreeMatches(Comp$competition_id)`

#### To read in events for a certain game:

`get.matchFree(Matches[1,])` 

It is important to note, that the argument here is the entire row returns from "FreeMatches", this is because there is information from each match observation that is needed in the `get.matchFree` function.

# API Data Access Instructions:

**API access is for paying customers only**

#### To read in just one game, simply run: 

1. `StatsBombData <- getmatch(username, password, match_id, season_id, competition_id)`

#### To read multiple games, run:

1. `matches <- matchesvector(username, password, season_id, competition_id)`
2. `StatsBombData <- allmatches(username, password, matches, season_id, competition_id, parallel = T)`

# Data Cleaning Helpers:

Although JSON files can often be a pain to clean, especially due to nested data frames, these helper functions may make your data wrangling much easier.

####To clean all of the data at once:

`StatsBombData <- allclean(StatsBombData)`

#### To clean all of the location variables simply run:

`StatsBombData <- cleanlocations(StatsBombData)`

Please note all location variables must be present in the data set. This function will not work with a subset of variables (location variables are missing).

#### To add the goalkeeper information from the freeze frame:

`StatsBombData <- goalkeeper(StatsBombData)`

Please note that additional information is located under type.name == "Goal Keeper" and within the Freeze Frames.

#### To add additional shot information:

`StatsBombData <- shotinfo(StatsBombData)`

#### To extract some information from the freeze frame:

`StatsBombData <- freezeframeinfo(StatsBombData)`

Description of these variables:

- Density is calculated as the aggregated inverse distance for each defender behind the ball.
- Density in the cone is the density filtered for only defenders who are in the cone between the shooter, and each goal post.

# Final Notes:

- Please re-install frequently, as new functions and bug fixes will be added regularly.
- As always, check out the Rdocumentation for each function (ex. `?StatsBombFreeEvents()`) for more specific description.
- Please contact [support@statsbombservices.com](support@statsbombservices.com) with bugs and suggestions.
