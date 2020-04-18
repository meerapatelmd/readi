#' Set Readi S4 Class
#' A Readi object contains the contents of a README File Details section and a dataframe on the same File Details pertaining to a specific Excel or csv file written out of R.
#' @slot dataframe dataframe of the Readi arguments specific to a given dataframe output file
#' @slot readme full README read from the README in the working directory as a character vector.
#' @export Readi
#' @exportClass Readi
Readi <- setClass("Readi", representation(dataframe = "tbl_df", readme = "character"))
