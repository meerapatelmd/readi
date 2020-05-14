#' Return metrics on all the Tabs in an Excel
#' @description  Also note that this function is similar to the trace_objects() function, except the this function is meant to  report the metrics of the final data written to the tabs while the trace_objects() is tracing the provenance prior to writing to Excel.
#' @param path_to_excel path to the Excel to generate metrics on
#' @return dataframe of 1. Object Name, 2. Object Class, 3. Length, 4. Names, 5. Rows, 6. Cols, and 7. Column Names. Vectors that were originally of length 1 or greater were converted to a string that is parseable into an expression using the vector_to_string function in the cave package. The value can be converted back to a vector using the cave package's string_to_vector function.
#' @importFrom rubix map_names_set
#' @importFrom cave vector_to_string
#' @importFrom purrr transpose
#' @importFrom purrr map
#' @importFrom dplyr bind_rows
#' @export


report_metrics <-
    function(path_to_excel) {


        obj_list <-
            broca::read_full_excel(path_to_excel)

        objClass <- lapply(obj_list, class) %>%
            rubix::map_names_set(function(x) ifelse(length(x) >1,cave::vector_to_string(x), x))
        objLength <- lapply(obj_list, length) %>%
            rubix::map_names_set(function(x) ifelse(is.null(x),0, x))
        objNames <- lapply(obj_list, names) %>%
            rubix::map_names_set(function(x) ifelse(!is.null(x),cave::vector_to_string(x), ""))
        objRows <- lapply(obj_list, nrow) %>%
            rubix::map_names_set(function(x) ifelse(is.null(x),0, x))
        objCols <- lapply(obj_list, ncol) %>%
            rubix::map_names_set(function(x) ifelse(is.null(x),0, x))
        objColnames <- lapply(obj_list, colnames) %>%
            rubix::map_names_set(function(x) ifelse(!is.null(x),cave::vector_to_string(x), ""))




        output <-
            list(Class = objClass,
                 Length = objLength,
                 Names = objNames,
                 Rows = objRows,
                 Cols = objCols,
                 Colnames = objColnames) %>%
            purrr::transpose() %>%
            purrr::map(as.data.frame) %>%
            dplyr::bind_rows(.id = "Tab")




        return(output)


    }
