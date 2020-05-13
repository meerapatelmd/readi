#' Save a note
#' @description The note is cached according to the script path and basename of working directory
#' @importFrom tibble tibble
#' @importFrom secretary typewrite_note
#' @importFrom R.cache loadCache
#' @importFrom R.cache saveCache
#' @importFrom cave present_script_path
#' @export

save_note <-
    function(vector) {

            string <- paste(vector, collapse = "\n")

            key <- list(cave::present_script_path())
            saved_notes <- R.cache::loadCache(key=key,
                                              dirs=basename(getwd()),
                                              onError = "error")
            if (is.null(saved_notes)) {
                secretary::typewrite_note("No notes found in R.cache dir", crayon::italic(basename(getwd())), " and a new one will be created.")
                output <-
                tibble::tibble(Timestamp = stampede::stamp_this(),
                               Note = string)

                R.cache::saveCache(object=output,
                                    key=key,
                                   dirs=basename(getwd()))


            } else {
                output <-
                    dplyr::bind_rows(saved_notes,
                    tibble::tibble(Timestamp = stampede::stamp_this(),
                                   Note = string))

                R.cache::saveCache(object=output,
                                   key=key,
                                   dirs=basename(getwd()))

            }
           return(output)
    }
