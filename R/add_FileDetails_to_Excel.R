#' Update an Excel file with a File Details tab
#' @importFrom broca read_full_excel
#' @export

add_FileDetails_to_Excel <-
    function(FileDetails_obj, path_to_excel) {

       dataframe <- output@standard

        if (is.data.frame(output@notes)) {
            dataframe <-
                dplyr::bind_rows(dataframe,
                                 output@notes)
        }

        if (is.data.frame(output@add_on)) {
            dataframe <-
                dplyr::bind_rows(dataframe,
                                 output@add_on)
        }

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
