#' Writes a README object to the README.md
#' @importFrom readr write_lines
#' @export

write_README <-
    function(README_object) {
            readr::write_lines(README_object@before_section, "README.md", sep = "  \n")
            readr::write_lines(README_object@section, "README.md", append = TRUE,  sep = "  \n")
            readr::write_lines(README_object@after_section, "README.md", append = TRUE, sep = "  \n")
    }
