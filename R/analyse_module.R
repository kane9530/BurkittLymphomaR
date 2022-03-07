#' Visualization of gene expression modules in samples with Heatmap
#'
#' Wrapper function to analyse gene modules
#'
#' @param diffGenes voom-processed DGEList
#' @param modulePick Integer of specific module to analyse from \code{\link[stats]{cutree}} function
#' @param moduleAssign Output of \code{\link[stats]{cutree}} function
#' @param heatcolors RColorBrewer palette
#' @param toExport Boolean indicating whether a .tsv file of the module genes should be exported
#' @param filename filename of exported .tsv file, if toExport is set to TRUE
#' @importFrom stats hclust cor as.dist as.dendrogram
#' @importFrom gtools mixedsort
#' @importFrom gplots heatmap.2
#' @importFrom dplyr tibble as_tibble
#' @importFrom readr write_tsv
#' @importFrom grDevices rainbow

analyse_module <- function(diffGenes, modulePick, moduleAssign, heatcolors, toExport, filename){
  modulePick <- modulePick #use 'c()' to grab more than one cluster from the heatmap.  e.g., c(1,2)
  #now we pull out the genes from this module using a fancy subsetting operation on a named vector
  myModule <- diffGenes[names(moduleAssign[moduleAssign %in% modulePick]),]
  myModule.ordered <- myModule[,gtools::mixedsort(colnames(myModule))]
  hrsub <- hclust(as.dist(1-cor(t(myModule.ordered), method="pearson")), method="complete")

  module.color <- rainbow(length(unique(moduleAssign)), start=0.1, end=0.9)
  module.color <- module.color[as.vector(moduleAssign)]
  names(module.color) <- names(moduleAssign)

  heatmap.2(myModule.ordered,
            Rowv=as.dendrogram(hrsub),
            Colv=FALSE,
            dendrogram="row",
            labRow = NA,
            col=rev(heatcolors), scale="row",
            density.info="none", trace="none",
            RowSideColors=module.color[moduleAssign%in%modulePick], margins=c(8,20))

  # Export modules for downstream analysis ----
  #prints out genes in the order you see them in the cluster
  if (toExport){
    moduleSymbols <- tibble(geneID = rev(hrsub$labels[hrsub$order]))
    moduleData <- diffGenes[moduleSymbols$geneID,]
    moduleData.df <- as_tibble(moduleData, rownames = "geneSymbol")
    write_tsv(moduleData.df,filename)
  }

}
