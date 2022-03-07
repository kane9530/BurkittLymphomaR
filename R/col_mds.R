#' Generate colors for \code{\link[limma]{plotMDS}} function from Rcolorbrewer palettes
#'
#' Helper function used for plotting the multidimensional scaling (MDS) plot
#'
#' @param metadata The metadata dataframe with column containing group of interest
#' @param column_name A string of the column name
#' @param brewer_pal The Rcolorbrewer palette to select colors from
#' @return A character vector containing color names
#' @importFrom RColorBrewer brewer.pal

col_mds <- function(metadata, column_name, brewer_pal="Set1"){
  col.column <- factor(metadata[[column_name]])
  levels(col.column)<-brewer.pal(nlevels(col.column), brewer_pal)
  col.column <- as.character(col.column)
  return (col.column)
}


