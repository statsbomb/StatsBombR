annotate_pitchSB <- function (colour = "black", fill = "white", x_scale = 1.2,
                              y_scale = 0.8, x_shift = 0, y_shift = 0, lwd = 0.5){
  markings <-
    list(
      ggplot2::geom_rect(
        xmin = 0 * x_scale +  x_shift,
        xmax = 100 * x_scale + x_shift,
        ymin = 0 * y_scale +
          y_shift,
        ymax = 100 * y_scale + y_shift,
        colour = colour,
        fill = fill,
        size = lwd
      ),
      ggplot2::annotation_custom(
        grob = grid::circleGrob(
          r = grid::unit(1,  "npc"),
          gp = grid::gpar(col = colour, fill = fill, lwd = 2)
        ),
        xmin = (50 - 7) * x_scale + x_shift,
        xmax = (50 + 7) * x_scale + x_shift,
        ymin = (50 - 7) * y_scale + y_shift,
        ymax = (50 + 7) * y_scale + y_shift
      ),
      ggplot2::annotate(
        geom = "point",
        x = 50 * x_scale + x_shift,
        y = 50 * y_scale + y_shift,
        colour = colour,
        fill = fill
      ),
      ggplot2::annotate(
        "segment",
        x = 50 * x_scale + x_shift,
        xend = 50 * x_scale + x_shift,
        y = 0 * y_scale + y_shift,
        yend = 100 * y_scale + y_shift,
        colour = colour ,
        size = lwd
      ),
      ggplot2::annotation_custom(
        grob = grid::circleGrob(
          r = grid::unit(1,
                         "npc"),
          gp = grid::gpar(col = colour, fill = fill, lwd = 2)
        ),
        xmin = (88.5 - 7) * x_scale + x_shift,
        xmax = (88.5 +
                  7) * x_scale + x_shift,
        ymin = (50 - 7) * y_scale +
          y_shift,
        ymax = (50 + 7) * y_scale + y_shift
      ),
      ggplot2::geom_rect(
        xmin = 83 *
          x_scale + x_shift,
        xmax = 100 * x_scale + x_shift,
        ymin = 21.1 *
          y_scale + y_shift,
        ymax = 79.9 * y_scale + y_shift,
        colour = colour,
        fill = fill,
        size = lwd
      ),
      ggplot2::annotate(
        geom = "point",
        x = 88.5 *
          x_scale + x_shift,
        y = 50 * y_scale + y_shift,
        colour = colour,
        fill = fill
      ),
      ggplot2::annotation_custom(
        grob = grid::circleGrob(
          r = grid::unit(1,
                         "npc"),
          gp = grid::gpar(col = colour, fill = fill, lwd = 2)
        ),
        xmin = (11.5 - 7) * x_scale + x_shift,
        xmax = (11.5 +
                  7) * x_scale + x_shift,
        ymin = (50 - 7) * y_scale +
          y_shift,
        ymax = (50 + 7) * y_scale + y_shift
      ),
      ggplot2::geom_rect(
        xmin = 0 *
          x_scale + x_shift,
        xmax = 17 * x_scale + x_shift,
        ymin = 21.1 *
          y_scale + y_shift,
        ymax = 79.9 * y_scale + y_shift,
        colour = colour,
        fill = fill,
        size = lwd
      ),
      ggplot2::annotate(
        geom = "point",
        x = 11.5 *
          x_scale + x_shift,
        y = 50 * y_scale + y_shift,
        colour = colour,
        fill = fill
      ),
      ggplot2::geom_rect(
        xmin = 94.2 * x_scale +
          x_shift,
        xmax = 100 * x_scale + x_shift,
        ymin = 36.8 *
          y_scale + y_shift,
        ymax = 63.2 * y_scale + y_shift,
        colour = colour,
        fill = fill,
        size = lwd
      ),
      ggplot2::geom_rect(
        xmin = 0 * x_scale +
          x_shift,
        xmax = 5.8 * x_scale + x_shift,
        ymin = 36.8 *
          y_scale + y_shift,
        ymax = 63.2 * y_scale + y_shift,
        colour = colour,
        fill = fill,
        size = lwd
      ),
      ggplot2::geom_rect(
        xmin = 100 * x_scale +
          x_shift,
        xmax = 102 * x_scale + x_shift,
        ymin = 44.2 *
          y_scale + y_shift,
        ymax = 55.8 * y_scale + y_shift,
        colour = colour,
        fill = fill,
        size = lwd
      ),
      ggplot2::geom_rect(
        xmin = 0 * x_scale +
          x_shift,
        xmax = -2 * x_scale + x_shift,
        ymin = 44.2 *
          y_scale + y_shift,
        ymax = 55.8 * y_scale + y_shift,
        colour = colour,
        fill = fill,
        size = lwd
      )
    )
  return(markings)
}
