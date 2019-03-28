removeallexcept <- function(charactervector){
  rm(list = setdiff(ls(), charactervector))
}
