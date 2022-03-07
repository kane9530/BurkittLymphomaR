#' Plot the Manhattan plot for functional enrichment results from \code{\link[gprofiler2]{gostplot}}
#'
#' @param interactive Boolean. If TRUE, will return an interactive gostplot.
#' @inheritParams analyse_module
#' @importFrom gprofiler2 gost gostplot publish_gostplot
#' @importFrom magrittr %>%

plot_gostplot <- function(diffGenes, modulePick, moduleAssign, interactive=F){

  mymodule <- diffGenes[names(moduleAssign[moduleAssign %in% modulePick]),]
  gost.res <- gost(rownames(mymodule), organism = "hsapiens", correction_method = "fdr")
  # produce an interactive manhattan plot of enriched GO terms
  mygostplot <- gostplot(gost.res, interactive = interactive, capped = T) #set interactive=FALSE to get plot for publications
  if (!interactive){
    publish_gostplot(
      mygostplot, #your static gostplot from above
      # highlight_terms = c("GO:0034987"),
      filename = NULL,
      width = NA,
      height = NA)
  }
  else{
  return(mygostplot)
  }
}
