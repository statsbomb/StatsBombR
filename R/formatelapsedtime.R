formatelapsedtime <- function (df) {
  df <- df %>% 
    mutate(milliseconds = as.numeric(str_extract(timestamp, "[[:digit:]]+$"))) %>% 
    mutate(ElapsedTime = minute * 60 * 1000 + second * 1000 + milliseconds) %>%
    ungroup()
  
  time_lost <- df %>%
    group_by(match_id, period) %>%
    summarise(endhalf = max(ElapsedTime),
              starthalf = min(ElapsedTime)) %>%
    mutate(time_lost = dplyr::lag(endhalf)-starthalf,
           time_lost = ifelse(is.na(time_lost), 0, time_lost), 
           time_lost = cumsum(time_lost)) %>%
    ungroup() %>%
    select(match_id, period,time_lost)
  
  df <- df %>%
    left_join(time_lost) %>%
    mutate(ElapsedTime = ElapsedTime + time_lost) %>%
    select(-time_lost) %>%
    mutate(ElapsedTime = ElapsedTime/1000) %>%
    ungroup()
  return(df)
}
