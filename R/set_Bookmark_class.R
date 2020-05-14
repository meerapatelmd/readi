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
