#' Update an Excel file with a File Details tab
#' @importFrom broca read_full_excel
#' @importFrom xlsx write.xlsx
#' @export

update_excel <-
    function(readi_object, path_to_excel) {

        excel <- broca::read_full_excel(path_to_excel)
        if ("File Details" %in% names(excel)) {
            excel[["File Details"]] <-
                dplyr::bind_rows(excel[["File Details"]],
                                  readi_object@dataframe)

            broca::write_full_excel(x = excel,
                                    file = path_to_excel)
        } else {
            excel[[length(excel)+1]] <- readi_object@dataframe
            names(excel)[length(excel)] <- "File Details"

            broca::write_full_excel(x = excel,
                                    file = path_to_excel)
        }

    }
