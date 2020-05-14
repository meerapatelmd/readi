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
