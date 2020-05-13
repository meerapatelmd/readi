#' View all notes
#' @description The note is cached according to the script path and basename of working directory
#' @importFrom tibble tibble
#' @importFrom secretary typewrite_note
#' @importFrom R.cache loadCache
#' @importFrom R.cache saveCache
#' @importFrom cave present_script_path
#' @export

view_notes <-
    function() {

            key <- list(cave::present_script_path())
            saved_notes <- R.cache::loadCache(key=key,
                                              dirs=basename(getwd()),
                                              onError = "error")
            if (is.null(saved_notes)) {
                secretary::typewrite_note("No notes found in R.cache dir", crayon::italic(basename(getwd())))

            } else {
                return(saved_notes)

            }
    }
