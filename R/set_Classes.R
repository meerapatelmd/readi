#' Set README S4 Class
#' A README object contains the contents of a README split by a given section name
#' @slot section_headings all the lines in the README.md input that begin with regular expression "^# .*$"
#' @slot before_section vector of lines before a given section
#' @slot section vector of lines within a given section
#' @slot after_section vector of lines after a given section
#' @export README
#' @exportClass README
#'
README <- setClass("README", representation(section_headings = "character",
                                            before_section = "character",
                                            section = "character",
                                            after_section = "character"),
                   prototype(section_headings = "",
                             before_section = "",
                             section = "",
                             after_section = ""))



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
                        prototype(standard = NA_character_,
                                  add_on = NA_character_,
                                  notes = NA_character_,
                                  text = NA_character_))


#' Set the Trace S4 Object Class
#' @export Trace
#' @exportClass Trace

Trace <- setClass("Trace",
                  representation(trace_timestamp = "character",
                                 r_script = "character",
                                 trace_dataframe = "tbl_df"))



#' Set Bookmark S4 Class
#' @export Bookmark
#' @exportClass Bookmark

Bookmark <- setClass("Bookmark",
                     representation(
                         bookmark_timestamp = "character",
                         r_script = "character",
                         bookmark_dataframe = "tbl_df",
                         trace = "Trace")
)
