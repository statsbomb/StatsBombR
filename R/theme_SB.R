theme_SB <- function(textscale = 1){
  tsb <- theme(plot.background = element_rect(colour="#f6f6f6", fill = "#f6f6f6"),
               axis.text.y = element_text(size=14*textscale),
               axis.title = element_text(size=14*textscale),
               axis.text.x   = element_text(size=14*textscale),
               axis.ticks = element_blank(),
               panel.background = element_rect(fill = "white", colour = "#dc2228"),
               panel.grid.major = element_blank(),
               panel.grid.minor = element_blank(),
               plot.title=element_text(size=22*textscale, face="bold"),
               plot.subtitle=element_text(size=16*textscale, face="bold"),
               plot.caption=element_text(size =10*textscale),
               legend.title = element_text(size=12*textscale),
               legend.text = element_text(size=12*textscale),
               legend.key=element_rect(fill='white'),
               legend.box = "horizontal",
               text=element_text(color="gray25", family="Source Sans Pro"))
  return(tsb)
}

