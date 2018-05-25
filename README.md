# StatsBombR

#### By:Derrick Yam

#### derrick.yam@statsbombservices.com

This repository is an R package to easily stream StatsBomb data into R using your log in credentials.

Currently, this package is only supported on Windows as the parallel computing requires different packages on mac.

To test one game, simply run: 

1. StatsBombData <- getmatch(username, password, match_id, season_id, competition_id)
2. StatsBombData <- cleanlocations(StatsBombData)

To test multiple games, run:

1. matches <- matchesvector(username, password, season_id, competition_id)
2. StatsBombData <- allmatches(username, password, matches, season_id, competition_id, parallel = T)
3. StatsBombData <- cleanlocations(StatsBombData)


shot.freeze_frames can be cleaned in similar ways as the cleanlocations function. However, since people may have different purposes for each of their analyses no function is written for them at the moment.
