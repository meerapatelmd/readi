#' Make a Bookmark S4 Class object
#' @description Bookmarks provide the line of code where objects reported in the Trace object
#' @importFrom readr read_lines
#' @importFrom tibble tibble
#' @importFrom rubix filter_at_grepl
#' @importFrom rubix call_mr_clean
#' @importFrom stampede stamp_this
#' @export

make_Bookmark <-
    function(Trace_obj) {
        Bookmark_obj <- new("Bookmark")
        Bookmark_obj@trace <- Trace_obj

        object_pointers <- paste(paste0(Trace_obj@trace_dataframe$`Object Name`, " <- "), collapse = "|")
        code_lines <- readr::read_lines(Bookmark_obj@trace@r_script)
        code_lines_df <-
            tibble::tibble(line_number = 1:length(code_lines),
                           code_snippet = code_lines) %>%
            rubix::filter_at_grepl(col = code_snippet,
                                   grepl_phrase = object_pointers,
                                   ignore.case = FALSE) %>%
            rubix::call_mr_clean()

        Bookmark_obj@bookmark_timestamp <- stampede::stamp_this()
        Bookmark_obj@r_script <- Bookmark_obj@trace@r_script
        Bookmark_obj@bookmark_dataframe <- code_lines_df
        return(Bookmark_obj)
    }

