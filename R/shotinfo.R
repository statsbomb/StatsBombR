shotinfo <- function(dataframe){
  ##Calculate a distance from shot and distance from center of frame variable
  dataframe <- dataframe %>%
    mutate(location.x = ifelse(location.x == 120 & location.y == 40, 119.66666, location.x)) %>%
    mutate(location.x.GK = ifelse(location.x.GK == 120 & location.y.GK == 40, 119.88888, location.x.GK)) %>%
    mutate(DistToGoal = sqrt((location.x - 120)^2 + (location.y - 40)^2),
           DistToKeeper = sqrt((location.x.GK - 120)^2 + (location.y.GK - 40)^2)) %>%
    mutate(AngleToGoal = ifelse(location.y <= 40, asin((120-location.x)/DistToGoal), (pi/2) + acos((120-location.x)/DistToGoal))) %>%
    mutate(AngleToKeeper = ifelse(location.y.GK <= 40, asin((120-location.x.GK)/DistToKeeper), (pi/2) + acos((120-location.x.GK)/DistToKeeper))) %>%
    mutate(AngleToGoal = AngleToGoal*180/pi) %>%
    mutate(AngleToKeeper = AngleToKeeper*180/pi) %>%
    mutate(AngleDeviation = abs(AngleToGoal-AngleToKeeper)) %>%
    #mutate(duration = ifelse(duration <= 0.1, 0.1, duration)) %>%
    mutate(avevelocity = sqrt((shot.end_location.x - location.x)^2 +
                                (shot.end_location.y - location.y)^2)/duration) %>%
    mutate(DistSGK = sqrt((location.x - location.x.GK)^2 + (location.y - location.y.GK)^2))

  return(dataframe)
}
