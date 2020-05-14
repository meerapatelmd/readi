#' Get a section_name in GitHub Flavored Markdown heading format
#' @export

to_heading <-
    function(section_name) {
        return(paste0("# ", section_name))
    }
