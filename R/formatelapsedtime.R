formatelapsedtime <- function(df){
  df <- df %>%
    mutate(milliseconds = as.numeric(str_extract(timestamp, "[[:digit:]]+$"))) %>%
    mutate(ElapsedTime = minute*60*100 + second*1000 + milliseconds)

  periods <- df %>%
    group_by(match_id, period) %>%
    summarise(endhalf = max(ElapsedTime)) %>%
    mutate(period = period + 1)

  firsthalf <- tibble(match_id = unique(periods$match_id),
                      period = 1,
                      endhalf = 0)

  periods <- bind_rows(periods, firsthalf)

  df <- left_join(df, periods) %>%
    ungroup() %>%
    mutate(ElapsedTime = endhalf + ElapsedTime) %>%
    select(-endhalf, milliseconds)
  return(df)
}
