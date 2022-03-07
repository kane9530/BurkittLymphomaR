#' Plot the log2 counts per million of samples
#'
#' @param DGEList An edgeR::DGEList object
#' @param samples_id A grouped_df data.frame with a biospecimen_id column
#' @param subtitle Subtitle name for ggplot
#' @importFrom edgeR cpm
#' @importFrom tidyr pivot_longer
#' @importFrom dplyr filter left_join
#' @importFrom ggplot2 ggplot
#' @importFrom assertthat assert_that
#'

plot_log2cpm <- function(DGEList, samples_id, subtitle){

  ## Obtain log2 counts per million (CPM)
  assert_that("biospecimen_id" %in% colnames(samples_id), msg="samples_id grouped_df should contain a column called biospecimen_id")
  log2.cpm<- cpm(DGEList, log=TRUE)
  log2.cpm.df <- as_tibble(log2.cpm, rownames = "geneID")

  log2.cpm.df.pivot <- pivot_longer(
    log2.cpm.df,
    cols = DGEList[["samples"]][["biospecimen_id"]],
    names_to = "biospecimen_id",
    values_to = "expression") %>%
    dplyr::filter(biospecimen_id %in% samples_id$biospecimen_id) %>%
    left_join(samples_id, by = "biospecimen_id")

  ## Plotting to see distribution of unfiltered, unnormalised data

  ggplot(log2.cpm.df.pivot) +
    ggplot2::facet_wrap(~ebv_status, scales = "free_y")+
    ggplot2::aes(x=short_name, y=expression, fill=short_name) +
    ggplot2::geom_violin(trim = FALSE, show.legend = FALSE) +
    ggplot2::stat_summary(fun = "median",
                 geom = "point",
                 shape = 95,
                 size = 10,
                 color = "black",
                 show.legend = FALSE) +
    ggplot2::labs(y="log2 expression", x = "sample",
         title="Log2 Counts per Million (CPM)",
         subtitle=subtitle,
         caption=paste0("Produced on ", Sys.time())) +
    ggplot2::theme_bw() +
    ggplot2::coord_flip()
}
