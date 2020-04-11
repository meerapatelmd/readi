#' Set the Readi object class
#' @export

set_readi_class <-
    function() {
        setClass("Readi", representation(dataframe = "tbl_df", readme = "character"))
    }
