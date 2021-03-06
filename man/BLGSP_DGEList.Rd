% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{BLGSP_DGEList}
\alias{BLGSP_DGEList}
\title{RNA-seq expression data for endemic vs sporadic Burkitt Lymphoma}
\format{
A DGEList object with counts, sample metadata and genes slots. The counts slot contains a matrix with 58143 rows (genes) and 129 variables (samples):
\describe{
\item{pos_1}{EBV-positive subject 1}
\item{neg_1}{EBV-negative subject 1}
...
}
}
\source{
\url{https://cgci-data.nci.nih.gov/Public/BLGSP/mRNA-seq/L3/expression/SFU/expression_matrix.counts.tsv}
}
\usage{
BLGSP_DGEList
}
\description{
A DGEList object containing counts of reads mapping to human genes
}
\keyword{datasets}
