#' Set FileDetailsText S4 Class
#' A FileDetailsText object contains the text version of File Details destined for README.md or another wordprocessing file.
#' @slot Long File Details dataframe structured as a list
#' @slot Wide File Details dataframes structured more like a dataframe
#' @export FileDetailsText
#' @exportClass FileDetailsText

FileDetailsText <- setClass("FileDetailsText",
                            representation(Long = "character",
                                            Wide = "character"),
                            prototype(Long = "",
                                         Wide = ""))

