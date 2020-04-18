#' Set the Readi object class
#' @export Readi
#' @exportClass Readi
Readi <- setClass("Readi", representation(dataframe = "tbl_df", readme = "character"))
