GetPlayerFootedness <- function(Passes){
  ##Get the player footedness from the passes they make.
  #We work under the assumption (tested assumption)
  #That player's use their dominant foot the majority of the time.
  #You can load all of the data, but it must include the type.name and the player id.
  Passes <- Passes %>%
    filter(type.name == "Pass") %>%
    filter(pass.body_part.name %in% c("Left Foot", "Right Foot"))

  Footedness <- Passes %>%
    group_by(player.name, player.id) %>%
    summarise(RightFoot = sum(pass.body_part.name == "Right Foot")/n(),
              LeftFoot = sum(pass.body_part.name == "Left Foot")/n(),
              DominantFoot = ifelse(RightFoot >= LeftFoot, "Right Foot", "Left Foot"))

  #Data frame returned with player name, player id, % right used, % left used, and Dominant Foot name.
  return(Footedness)

}
