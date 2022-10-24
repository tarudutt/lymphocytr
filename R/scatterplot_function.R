#' Scatterplot function
#'
#' @param data Dataframe that includes a column with percentage of immune cells
#'     and another column with bacterial counts or pathology scores.
#' @param mapping
#' @param ...
#' @param method A method to test correlation between two objects.
#'     Options include "spearman" and "pearson".
#'
#' @return Create a correlation plot comparing two parameters.
#' @export
#'
#' @examples

scatterPlot <- function(data,
                        method = "spearman") {

# make ggplot
  corr_plot <- ggplot2::ggplot(data, ggplot2::aes(x=CFU, y=value)) +
    ggplot2::geom_point(shape=16, show.legend = FALSE) +
    ggplot2::geom_smooth(method = "lm", col="steelblue") +
    ggplot2::theme_grey() + ggplot2::facet_wrap(~ name, scale = "free_y") +
    ggplot2::theme(axis.text.x = ggplot2::element_text(size = 12, face = "bold"),
          axis.text.y = ggplot2::element_text(size = 12),
          axis.title.x = ggplot2::element_text(size = 14, face = "bold"),
          axis.title.y = ggplot2::element_text(size = 14, face = "bold"),
          plot.title = ggplot2::element_text(color="black", size=16, face="bold")) +
    ggplot2::theme(strip.text = ggplot2::element_text(size=12, face = "bold")) +
    ggplot2::labs (y="Percentage of cells", x = "CFU (log10)") +
    ggplot2::ggtitle("Correlation plots") +
    ggpubr::stat_cor(method = method)

  return(corr_plot)
}


