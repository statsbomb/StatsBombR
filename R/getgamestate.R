get.gamestate <- function(AllEvents){
  ##Data must include at least one event from each team.
  ##Data must include all goals.
  ##Data should exclude the opposingteam variable.

  ##This function returns a new variable for the game state for the team who logged the current event.
  ##This function also returns a dataframe of the total minutes played at each state per team.

  AllEvents <- get.opposingteam(AllEvents)
  AllEvents <- AllEvents %>%
    arrange(match_id, index) %>%
    mutate(Goal = ifelse(lag(shot.outcome.name) == "Goal" | lag(type.name) == "Own Goal For", 1, 0)) %>%
    mutate(Goal = ifelse(is.na(Goal), 0, Goal)) %>%
    mutate(ScoringTeam = ifelse(lag(shot.outcome.name) == "Goal" | lag(type.name) == "Own Goal For", lag(team.name), NA)) %>%
    mutate(ScoringTeam = ifelse(is.na(ScoringTeam), NA, ScoringTeam)) %>%
    ungroup() %>%
    group_by(match_id) %>%
    tidyr::fill(ScoringTeam, .direction = ('down')) %>%
    mutate(ScoringTeam = ifelse(is.na(ScoringTeam), "No Goal", ScoringTeam)) %>%
    mutate(duration = ifelse(is.na(duration), 0.01, duration)) %>%
    mutate(TimeOfGoal = ifelse(Goal == 1, lag(ElapsedTime) + lag(duration), 0)) %>%
    group_by(match_id) %>%
    mutate(TotalScore = cumsum(Goal)) %>%
    group_by(match_id, ScoringTeam) %>%
    mutate(TeamScore = cumsum(Goal)) %>%
    mutate(OpposingScore = TotalScore - TeamScore) %>%
    mutate(GameState = ifelse(TeamScore == OpposingScore, "Drawing",
                              ifelse(TeamScore > OpposingScore, "Winning",
                                     ifelse(TeamScore < OpposingScore, "Losing", NA)))) %>%
    mutate(WinningTeam = ifelse(GameState == "Winning" & team.name == ScoringTeam, team.name,
                                ifelse(GameState == "Winning" & team.name != ScoringTeam, OpposingTeam,
                                       ifelse(GameState == "Losing" & team.name == ScoringTeam, OpposingTeam,
                                              ifelse(GameState == "Losing" & team.name != ScoringTeam, team.name, "Drawing"))))) %>%
    mutate(Score = ifelse(team.name == ScoringTeam, TeamScore, OpposingScore)) %>%
    mutate(OpposingScore = TotalScore - Score) %>%
    mutate(GameState = ifelse(Score > OpposingScore, "Winning",
                              ifelse(Score < OpposingScore, "Losing", "Drawing"))) %>%
    mutate(OpposingGameState = ifelse(Score > OpposingScore, "Losing",
                                      ifelse(Score < OpposingScore, "Winning", "Drawing"))) %>%
    mutate(WinningTeam = ifelse(GameState == "Winning", team.name,
                                ifelse(GameState == "Losing", OpposingTeam, "Drawing"))) %>%
    ungroup() %>%
    select(everything(), Goal, TimeOfGoal, Score, TotalScore, OpposingScore, GameState, OpposingGameState, WinningTeam) %>%
    select(-TeamScore, -ScoringTeam)

  ##Define the time at each state from the change in state.
  ##But we have to define the change in state from the scoring team.
  ##Since the change in state switches throughout each event.
  GameStates <- AllEvents %>%
    ungroup() %>%
    select(id, match_id, index, ElapsedTime, GameState, team.name, OpposingTeam, Score, OpposingScore,
           Goal, TimeOfGoal, OpposingGameState, WinningTeam) %>%
    group_by(match_id) %>%
    mutate(ChangeInState = ifelse(WinningTeam != lag(WinningTeam), 1, 0)) %>%
    mutate(ChangeInState = ifelse(is.na(ChangeInState), 0, ChangeInState)) %>%
    mutate(StateChanges = cumsum(ChangeInState)) %>%
    group_by(match_id, StateChanges) %>%
    mutate(TimeInBetween = max(ElapsedTime) - min(ElapsedTime)) %>%
    group_by(match_id, StateChanges) %>%
    slice(1) %>%
    group_by(match_id, WinningTeam) %>%
    summarise(Time = sum(TimeInBetween)) %>%
    rename(team.name = WinningTeam) %>%
    group_by(match_id) %>%
    mutate(TotalTime = sum(Time))

  ##Format for three observations per team per game
  FormatStates <- AllEvents %>%
    group_by(match_id, team.name) %>%
    slice(1) %>%
    select(match_id, team.name) %>%
    slice(rep(1:n(), each = 3))

  FormatStates <- FormatStates %>%
    ungroup() %>%
    mutate(GameState = rep(c("Winning", "Drawing", "Losing"), length(FormatStates$team.name)/3))

  ##Draws are easy.
  Drawing <- GameStates %>% filter(team.name == "Drawing") %>% rename(GameState = team.name)
  Draws <- FormatStates %>% filter(GameState == "Drawing")
  Drawing <- left_join(Draws, Drawing)
  Drawing <- Drawing %>% select(-TotalTime)

  ##Winning we need the opposing team.
  Opposition <- AllEvents %>%
    select(match_id, team.name, OpposingTeam) %>%
    group_by(match_id, team.name) %>%
    slice(1)
  Winning <- GameStates %>% filter(team.name != "Drawing") %>% mutate(GameState = "Winning")
  Winning <- left_join(Winning, Opposition)

  Losing <- Winning %>%
    select(match_id, team.name = OpposingTeam, Time, GameState) %>%
    mutate(GameState = "Losing")
  Winning <- Winning %>%
    select(match_id, team.name, Time, GameState)

  States <- bind_rows(Drawing, Winning, Losing) %>%
    arrange(match_id, team.name, GameState)

  GameStates <- left_join(FormatStates, States)

  GameStates <- GameStates %>% mutate(Time = ifelse(is.na(Time), 0, Time)) %>% mutate(Time = Time/60)

  ##Returns a list
  #temp <- get.gamestate(EPLclean)
  #AllEvents <- temp[1][[1]]
  #GameStates <- temp[2][[1]]


  return(list(AllEvents, GameStates))
}

