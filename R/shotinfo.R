shotinfo <- function(dataframe){
  ##Calculate a distance from shot and distance from center of frame variable
  dataframe <- dataframe %>%
    mutate(location.x = ifelse(location.x == 120 & location.y == 40, 119.66666, location.x)) %>%
    mutate(DistToGoal = sqrt((location.x - 120)^2 + (location.y - 40)^2),
           DistToKeeper = sqrt((location.x.GK - 120)^2 + (location.y.GK - 40)^2)) %>%
    mutate(AngleToGoal = asin((120-location.x)/DistToGoal)) %>%
    mutate(AngleToKeeper = asin((120-location.x.GK)/DistToKeeper)) %>%
    mutate(AngleToGoal = AngleToGoal*180/pi) %>%
    mutate(AngleToKeeper = AngleToKeeper*180/pi) %>%
    mutate(AngleToGoal = ifelse(location.y > 40, 90 + AngleToGoal, AngleToGoal),
           AngleToKeeper = ifelse(location.y.GK > 40,90 + AngleToKeeper, AngleToGoal)) %>%
    mutate(AngleDeviation = abs(AngleToGoal-AngleToKeeper)) %>%
    mutate(duration = ifelse(duration <= 0.1, 0.1, duration)) %>%
    mutate(maxvelocity = sqrt((shot.end_location.x - location.x)^2 +
                                (shot.end_location.y - location.y)^2)/duration)

  return(dataframe)
}
