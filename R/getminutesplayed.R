###

get.minutesplayed <- function(events){

  MatchIDs <- unique(events$match_id)
  get.minutesplayed.single.match <- function(MatchSelect){

    per.match <- events %>% filter(match_id == MatchSelect)
    match.length <- max(per.match$minute)
    line.up1 <- per.match[1,]$tactics.lineup[[1]]
    line.up1$team.name <- per.match[1,]$team.name

    line.up2 <- per.match[2,]$tactics.lineup[[1]]
    line.up2$team.name <- per.match[2,]$team.name

    line.ups <- bind_rows(line.up1, line.up2)
    line.ups <- line.ups %>% select(player.id, player.name, team.name)

    line.ups$time.start <- 0

    substitutions <- per.match %>% filter(type.name == "Substitution") %>% select(minute, team.name, player.name, player.id, substitution.replacement.name)
    substitutions.out <- substitutions %>% select(-substitution.replacement.name, -team.name, -player.id)

    line.ups <- merge(line.ups, substitutions.out, by = "player.name", all = T)

    substitutions.in <- data.frame(player.name = substitutions$substitution.replacement.name, team.name = substitutions$team.name, time.start = substitutions$minute, minute = match.length, stringsAsFactors = F)

    playerIDS <- per.match %>% group_by(player.name) %>% select(player.name, player.id)
    playerIDS <- unique(playerIDS)
    playerIDS <- playerIDS %>% filter(player.name %in% substitutions.in$player.name)

    substitutions.in <- merge(substitutions.in, playerIDS, by = "player.name")

    line.ups <- bind_rows(line.ups, substitutions.in)
    line.ups[is.na(line.ups)] <- match.length
    line.ups$Minutes.Played <- line.ups$minute - line.ups$time.start

    line.ups$match_id <- MatchSelect
    colnames(line.ups) <- c("player.name", "player.id", "team.name", "time.in", "time.out", "minutes.played", "match_id")

    return(line.ups)

  }

  MinsPlayedCatch <- MatchIDs %>%
    split(1:length(.)) %>%
    purrr::map(get.minutesplayed.single.match) %>%
    dplyr::bind_rows()

  MinsPlayedCatch <- MinsPlayedCatch %>% group_by(match_id, player.id) %>% slice(1)
  return(MinsPlayedCatch)

}
