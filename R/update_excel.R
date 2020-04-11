#' Update an Excel file with a File Details tab
#' @importFrom broca read_full_excel
#' @importFrom openxlsx write.xlsx
#' @export

update_excel <-
    function(readi_object, path_to_excel, ...) {
        data_list <- broca::read_full_excel(path_to_excel,
                                            ...)

        data_list <- c(list(`File Details` = readi_object@dataframe),
                       data_list)

        openxlsx::write.xlsx(data_list,
                             file = path_to_excel)

    }
