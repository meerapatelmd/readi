#' Create a Readi Dataframe
#' @importFrom rubix map_names_set
#' @importFrom tibble tibble
#' @param disable_rstudioapi TRUE if the RStudioAPI should be disabled. Errors can be thrown in Jobs and running scripts from the command line.
#' @export

make_AddOnFileDetailsDF <-
    function(...) {
        Args <- list(...)
        Args <-
            Args %>%
            rubix::map_names_set(function(x) paste(x, collapse = ",\n"))
        return(tibble::tibble(Topic = names(Args),
                                            Details = unlist(Args)))
    }
