#' Plot correlation plot correlation matrix
#'
#' @param path Dataframe that includes columns with percentage of immune cells
#'     and with bacterial counts or pathology scores.
#' @param correlation_data Merge the immune cell data with the other set of data to
#'     calculate the correlation coefficient.
#' @param cor Method to calculate correlation coefficient values.Method can be changed to
#'     "s" = Spearman or "p" = Pearson.
#' @return A correlation matrix.
#' @export
#'
#' @examples
correlation_matrix <- function(path) {
  cell_types <- readxl::read_excel(path, sheet = "cell_types")
  outcomes <- readxl::read_excel(path, sheet = "outcomes")
  correlation_data <- sp::merge(cell_types, outcomes, by = c("Groups", "Mice")) %>%
    dplyr::select(-c(Groups, Mice)) %>%
    cor(method="s") %>%
    corrplot::corrplot(title = "Correlation matrix",
             method = "square",
             outline = T,
             addgrid.col = "darkgray",
             order="hclust",
             mar = c(4,0,4,0),
             addrect = 4,
             rect.col = "black",
             rect.lwd = 5,cl.pos = "b",
             tl.col = "black",
             tl.cex = 1.0, cl.cex = 1.0)
  return(correlation_data)
}
