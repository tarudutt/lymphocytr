#' Fit cellname
#'
#' @param string Name of the cell type.
#' @param nwrap Number of cell type name character to wrap together.
#'
#' @return Split the name of the long cell type name into different sentences to fit into the graph.
#' @export
#'
#' @examples

fit_cellname = function(string, nwrap=20) {
  paste(strwrap(string, width=nwrap), collapse="\n")
}
fit_cellname = Vectorize(fit_cellname)
