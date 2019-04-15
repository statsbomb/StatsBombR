get.positioncategory <- function(AllPasses){
  AllPasses <- AllPasses %>%
    ungroup() %>%
    mutate(position.category = ifelse(position.name %in% c("Right Center Forward", "Left Center Forward", "Striker",
                                                           "Secondary Striker", "Center Forward"), "Forwards",
                                      ifelse(position.name %in% c("Center Attacking Midfield","Left Attacking Midfield", "Left Midfield",
                                                                  "Right Attacking Midfield", "Right Midfield",
                                                                  "Left Wing", "Right Wing"), "Attacking Midfielders",
                                             ifelse(position.name %in% c("Center Defensive Midfield", "Center Midfield",
                                                                         "Left Center Midfield", "Left Defensive Midfield",
                                                                         "Right Center Midfield", "Right Defensive Midfield"),
                                                    "Central Midfielders",
                                                    ifelse(position.name %in% c("Left Back", "Left Wing Back", "Right Back", "Right Wing Back"),
                                                           "Full Backs",
                                                           ifelse(position.name %in% c("Center Back", "Left Center Back", "Right Center Back"),
                                                                  "Center Backs",
                                                                  ifelse(grepl("Goalkeeper", position.name), "Goalkeepers", "Missing")))))))

  AllPasses$position.category <- factor(AllPasses$position.category, levels = c("Forwards", "Attacking Midfielders",
                                                                                "Central Midfielders", "Full Backs",
                                                                                "Center Backs", "Goalkeepers", "Missing"))

  playersusualposition <- AllPasses %>%
    group_by(position.category, player.id) %>%
    count() %>%
    arrange(player.id, desc(n)) %>%
    group_by(player.id) %>%
    dplyr::slice(1) %>%
    rename(TypicalPosition = position.category) %>%
    dplyr::select(-n)

  return(playersusualposition)
}
