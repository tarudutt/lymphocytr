#' Read data
#'
#' @param path Path to the file, which you want to use for making graphs.
#'
#'
#' @return Load the data in the required format to use in the pipeline.
#' @export
#'
#' @importFrom magrittr %>%
#'
#' @examples
read_data <- function(path) {
  cell_types <- readxl::read_excel(path, sheet = "cell_types") %>%
    tidyr::pivot_longer(col = -c(Groups, Mice))
  outcomes <- readxl::read_excel(path, sheet = "outcomes")
  combined_data <- sp::merge(cell_types, outcomes, by = c("Groups", "Mice"))
  return(combined_data)
}







