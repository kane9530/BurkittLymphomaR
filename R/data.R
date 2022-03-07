#' RNA-seq expression data for endemic vs sporadic Burkitt Lymphoma
#'
#' A DGEList object containing counts of reads mapping to human genes
#'
#' @format A DGEList object with counts, sample metadata and genes slots. The counts slot contains a matrix with 58143 rows (genes) and 129 variables (samples):
#' \describe{
#'   \item{pos_1}{EBV-positive subject 1}
#'   \item{neg_1}{EBV-negative subject 1}
#'   ...
#' }
#' @source \url{https://cgci-data.nci.nih.gov/Public/BLGSP/mRNA-seq/L3/expression/SFU/expression_matrix.counts.tsv}
"BLGSP_DGEList"

#' Sample metadata for each patient sample
#'
#' @format A tibble containing 129 observations of 20 variables:
#' \describe{
#'   \item{cohort}{Discovery/validation/Tonsils}
#'   \item{patient_barcode}{Patient barcode named according to OCG project code CGCI nomenclature structure}
#'   \item{clinical variant}{endemic/sporadic BL}
#'   ...
#' }
#' @source \url{https://cgci-data.nci.nih.gov/Public/BLGSP/clinical/SFU/metadata.patients.tsv}
"BLGSP_metadata"

#' List of EBV genes
#'
#' @format A list containing 113 EBV genes:
#' \describe{
#'   \item{LMP2}{LMP2 gene}
#'   ...
#' }
#' @source \url{"https://ftp.ncbi.nih.gov/genomes/Viruses/human_gammaherpesvirus_4_uid14413/NC_007605.gff"}
"ebv_genes"

#' MSigDB C2 collection
#'
#' @format A GeneSetCollection object from MSigDB:
#' \describe{
#'   \item{geneID()}{Extract gene IDs in each signature}
#'   ...
#' }
#' @source \url{"https://www.gsea-msigdb.org/gsea/msigdb/collections.jsp"}
"broadSet.C2.ALL"
