#' Update an Excel file with a File Details tab
#' @importFrom broca read_full_excel
#' @export

add_FileDetails_to_Excel <-
    function(FileDetails_obj, path_to_excel) {

        dataframe <- dplyr::bind_rows(FileDetails_obj@standard,
                                      FileDetails_obj@add_on,
                                      FileDetails_obj@notes)

        excel <- broca::read_full_excel(path_to_excel)
        if ("File Details" %in% names(excel)) {
            excel[["File Details"]] <-
                dplyr::bind_rows(excel[["File Details"]],
                                  dataframe)

            broca::write_full_excel(x = excel,
                                    file = path_to_excel)
        } else {
            excel[[length(excel)+1]] <- dataframe
            names(excel)[length(excel)] <- "File Details"

            broca::write_full_excel(x = excel,
                                    file = path_to_excel)
        }

    }
