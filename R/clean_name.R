#' Split string and select substring by index
#'
#' Helper function to generate the shortened sample names (replacing the longer biospecimen_id names)
#'
#' @param name A character string
#' @param split_by Character to split string by
#' @param element Element index to select from substring
#' @param start Start index of substring to select
#' @param stop End index of substring to select
#' @return An indexed substring
#' @importFrom magrittr %>%

clean_name <- function(name, split_by, element, start, stop){
  result <- sapply(strsplit(name, split=split_by),
                   getElement, element) %>%
    substr(start,stop)
  return(result)
}
