cleanlocations <- function(dataframe){
  dataframe <- dataframe %>%
    arrange(match_id, index)
   dataframe <- dataframe %>%
    mutate(location.x = str_extract(location, "[:digit:]+"),
           location.y = str_extract(location, "[:blank:][:digit:]+"),
           pass.end_location.x = str_extract(pass.end_location, "[:digit:]+"),
           pass.end_location.y = str_extract(pass.end_location, "[:blank:][:digit:]+"))

  dataframe <- dataframe %>%
    mutate(location.x = as.numeric(location.x),
           location.y = as.numeric(location.y),
           pass.end_location.x = as.numeric(pass.end_location.x),
           pass.end_location.y = as.numeric(pass.end_location.y))


  shots.df <- dataframe %>%
    filter(type.name == "Shot")
  shots.df$shot.end_location.x <- apply(shots.df, 1, x.f)
  shots.df$shot.end_location.y <- apply(shots.df, 1, y.f)
  shots.df$shot.end_location.z <- apply(shots.df, 1, z.f)
  shots.df$shot.end_location.x <- as.numeric(shots.df$shot.end_location.x)
  shots.df$shot.end_location.y <- as.numeric(shots.df$shot.end_location.y)
  shots.df$shot.end_location.z <- as.numeric(shots.df$shot.end_location.z)

  rest.df <- dataframe %>%
    filter(type.name != "Shot")

  rest.df$shot.end_location.x <- NA
  rest.df$shot.end_location.y <- NA
  rest.df$shot.end_location.z <- NA

  data.frame <- bind_rows(shots.df, rest.df) %>%
    arrange(match_id, index)
}


