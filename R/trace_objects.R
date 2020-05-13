#' Return metadata on the objects in the global environment
#' @description This function allows to view the series of transformations that occur in a given script. This function will only work effectively if the global environment only contains objects that are to be traced and all the object naming conventions are named such that the stem of the label match the pattern to trace the transformations in sequential order. For example an input can initially be input1 and after a transformation, the next version will be named input2 and the next input3 and so on. The complete list of teh glboal environment can also be obtained by not entering an objname_pattern.
#' @param objname_pattern pattern argument for the ls() base function
#' @return dataframe of 1. Object Name, 2. Object Class, 3. Length, 4. Names, 5. Rows, 6. Cols, and 7. Column Names. Vectors that were originally of length 1 or greater were converted to a string that is parseable into an expression using the vector_to_string function in the cave package. The value can be converted back to a vector using the cave package's string_to_vector function.
#' @importFrom rubix map_names_set
#' @importFrom cave vector_to_string
#' @importFrom purrr transpose
#' @importFrom purrr map
#' @importFrom dplyr bind_rows
#' @export

trace_objects <-
    function(objname_pattern) {

        objnames <- ls(pattern = objname_pattern, envir = globalenv())
        obj_list <-
            objnames %>%
            rubix::map_names_set(function(x) get(x))

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
            dplyr::bind_rows(.id = "Object Name")




        return(output)


    }
