#' Update an Excel file with a File Details tab
#' @importFrom broca read_full_excel
#' @importFrom xlsx write.xlsx
#' @export

update_excel <-
    function(readi_object, path_to_excel, ...) {

        xlsx::write.xlsx(x = readi_object@dataframe,
                         file = path_to_excel,
                         sheetName = "File Details",
                         row.names = FALSE,
                         append = TRUE)

    }
