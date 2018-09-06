formatelapsedtime <- function(df){
  df <- df %>%
    mutate(milliseconds = as.numeric(str_extract(timestamp, "[[:digit:]]+$"))) %>%
    mutate(ElapsedTime = minute*60*1000 + second*1000 + milliseconds)

  periods <- df %>%
    group_by(match_id, period) %>%
    summarise(endhalf = max(ElapsedTime)) %>%
    mutate(period = period + 1)

  firsthalf <- tibble(match_id = unique(periods$match_id),
                      period = rep(1, length(unique(periods$match_id))),
                      endhalf =  rep(0, length(unique(periods$match_id))))

  periods <- bind_rows(periods, firsthalf)

  df <- left_join(df, periods) %>%
    ungroup() %>%
    mutate(ElapsedTime = ifelse(period == 1, endhalf + ElapsedTime,
                                ifelse(period == 2, endhalf + ElapsedTime - (45*60*1000),
                                       ifelse(period == 3, endhalf + ElapsedTime  - (90*60*1000),
                                              ifelse(period == 4, endhalf + ElapsedTime  - (105*60*1000),
                                                     ifelse(period == 5, endhalf + ElapsedTime  - (120*60*1000), NA)))))) %>%
    mutate(ElapsedTime = ElapsedTime/1000) %>%
    select(-endhalf, milliseconds)
  return(df)
}
