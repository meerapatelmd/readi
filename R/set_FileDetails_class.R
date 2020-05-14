#' Set FileDetails S4 Class
#' A FileDetails object contains the contents of a README File Details section and a dataframe on the same File Details pertaining to a specific Excel or csv file written out of R.
#' @slot dataframe dataframe of the Readi arguments specific to a given dataframe output file
#' @slot readme_section vector of the README 'File Details' section
#' @export FileDetails
#' @exportClass FileDetails

FileDetails <- setClass("FileDetails",
                        representation(standard = "tbl_df",
                                       add_on = "tbl_df",
                                       notes = "tbl_df",
                                       text = "character"),
                        prototype(standard = "",
                                  add_on = "",
                                  notes = "",
                                  text = ""))

