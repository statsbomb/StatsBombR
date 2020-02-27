cleanlocations <- function(dataframe) {
  if("carry.end_location" %in% names(dataframe) == TRUE){
    dataframe <- dataframe %>%
      mutate(location.x = (map(location, 1)),
             location.y = (map(location, 2)),
             carry.end_location.x = (map(carry.end_location, 1)),
             carry.end_location.y = (map(carry.end_location, 2)),
             pass.end_location.x = (map(pass.end_location, 1)),
             pass.end_location.y = (map(pass.end_location, 2)),
             shot.end_location.x = (map(shot.end_location, 1)),
             shot.end_location.y = (map(shot.end_location, 2)),
             shot.end_location.z = (map(shot.end_location, 3)),
             shot_impact_height = (map(location, 3)))
    dataframe <- dataframe %>%
      mutate(location.x = as.numeric(ifelse(location.x == "NULL", NA, location.x)),
             location.y = as.numeric(ifelse(location.y == "NULL", NA, location.y)),
             carry.end_location.x = as.numeric(ifelse(carry.end_location.x == "NULL", NA, carry.end_location.x)),
             carry.end_location.y = as.numeric(ifelse(carry.end_location.y == "NULL", NA, carry.end_location.y)),
             pass.end_location.x = as.numeric(ifelse(pass.end_location.x == "NULL", NA, pass.end_location.x)),
             pass.end_location.y = as.numeric(ifelse(pass.end_location.y == "NULL", NA, pass.end_location.y)),
             shot.end_location.x = as.numeric(ifelse(shot.end_location.x == "NULL", NA, shot.end_location.x)),
             shot.end_location.y = as.numeric(ifelse(shot.end_location.y == "NULL", NA, shot.end_location.y)),
             shot.end_location.z = as.numeric(ifelse(shot.end_location.z == "NULL", NA, shot.end_location.z)),
             shot_impact_height = as.numeric(ifelse(shot_impact_height == "NULL", NA, shot_impact_height)))
    
  } else {
    dataframe <- dataframe %>%
      mutate(location.x = (map(location, 1)),
             location.y = (map(location, 2)),
             pass.end_location.x = (map(pass.end_location, 1)),
             pass.end_location.y = (map(pass.end_location, 2)),
             shot.end_location.x = (map(shot.end_location, 1)),
             shot.end_location.y = (map(shot.end_location, 2)),
             shot.end_location.z = (map(shot.end_location, 3)),
             shot_impact_height = (map(location, 3)))
    dataframe <- dataframe %>%
      mutate(location.x = as.numeric(ifelse(location.x == "NULL", NA, location.x)),
             location.y = as.numeric(ifelse(location.y == "NULL", NA, location.y)),
             pass.end_location.x = as.numeric(ifelse(pass.end_location.x == "NULL", NA, pass.end_location.x)),
             pass.end_location.y = as.numeric(ifelse(pass.end_location.y == "NULL", NA, pass.end_location.y)),
             shot.end_location.x = as.numeric(ifelse(shot.end_location.x == "NULL", NA, shot.end_location.x)),
             shot.end_location.y = as.numeric(ifelse(shot.end_location.y == "NULL", NA, shot.end_location.y)),
             shot.end_location.z = as.numeric(ifelse(shot.end_location.z == "NULL", NA, shot.end_location.z)),
             shot_impact_height = as.numeric(ifelse(shot_impact_height == "NULL", NA, shot_impact_height)))
  }
  
  return(dataframe)
}
