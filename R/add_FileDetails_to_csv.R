#' Add Readi object to a csv file by converting it into Excel
#' @description The csv file is deleted at the conclusion.
#' @importFrom readr read_csv
#' @importFrom cave strip_fn
#' @importFrom openxlsx write.xlsx
#' @import glitter
#' @export

add_FileDetails_to_csv <-
    function(FileDetails_obj, path_to_csv, commit = TRUE) {
        dataframe <- FileDetails_obj@standard

        if (is.data.frame(FileDetails_obj@notes)) {
            dataframe <-
                dplyr::bind_rows(dataframe,
                                 FileDetails_obj@notes)
        }

        if (is.data.frame(FileDetails_obj@add_on)) {
            dataframe <-
                dplyr::bind_rows(dataframe,
                                 FileDetails_obj@add_on)
        }

        if (commit == FALSE) {

                    csv_data <- broca::simply_read_csv(path_to_csv = path_to_csv)
                    new_tab_name <- substr(cave::strip_fn(path_to_csv), 1, 31)
                    new_excel_fn <- paste0(cave::strip_fn(path_to_csv, rm_path = FALSE), ".xlsx")


                    output <- list()
                    output[[1]] <- dataframe
                    output[[2]] <- csv_data

                    names(output) <- c("File Details", new_tab_name)

                    openxlsx::write.xlsx(output,
                                         new_excel_fn)

                    file.remove(path_to_csv)

        } else {
            deltas <- glitter::files_to_commit(path_to_local_repo = path(path_to_csv))
            if (basename(path_to_csv) %in% deltas) {
                    glitter::add_commit_some(path_to_local_repo = path(path_to_csv),
                                             filenames = path_to_csv)
            }

            csv_data <- broca::simply_read_csv(path_to_csv = path_to_csv)
            new_tab_name <- substr(cave::strip_fn(path_to_csv), 1, 31)
            new_excel_fn <- paste0(cave::strip_fn(path_to_csv, rm_path = FALSE), ".xlsx")

            output <- list()
            output[[1]] <- dataframe
            output[[2]] <- csv_data

            names(output) <- c("File Details", new_tab_name)

            openxlsx::write.xlsx(output,
                                 new_excel_fn)

            glitter::add_commit_some(path_to_local_repo = path(path_to_csv),
                                     filenames = new_excel_fn,
                                     commit_message = paste0("add FileDetails and convert ", path_to_csv, " to ", new_excel_fn))

            file.remove(path_to_csv)

            glitter::add_commit_some(path_to_local_repo = path(path_to_csv),
                                     filenames = path_to_csv,
                                     commit_message = paste0(path_to_csv, " written to ", new_excel_fn))


        }
}
