#' Add Readi object to a csv file by converting it into Excel
#' @importFrom readr read_csv
#' @importFrom cave strip_fn
#' @importFrom openxlsx write.xlsx
#' @export

attach_to_csv <-
    function(readi_object, path_to_csv) {
        csv_data <- readr::read_csv(path_to_csv,
                                    col_types = cols(.default = "c"))
        new_tab_name <- cave::strip_fn(path_to_csv)
        new_excel_fn <- paste0(cave::strip_fn(path_to_csv, rm_path = FALSE), ".xlsx")

        output <- list()
        output[[1]] <- readi_object@dataframe
        output[[2]] <- csv_data

        names(output) <- c("File Details", new_tab_name)
        openxlsx::write.xlsx(output,
                             new_excel_fn)
}
