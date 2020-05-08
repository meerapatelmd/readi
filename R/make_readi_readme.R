#' Make the File Details section for the README.md in wd
#' @importFrom dplyr transmute
#' @importFrom dplyr select
#' @export

make_readi_readme <-
    function(readi_df) {
        readi_df %>%
            dplyr::transmute(Readme = paste0(Topic, ":\t", Details)) %>%
            dplyr::select(Readme) %>%
            unlist() %>%
            unname()
    }
