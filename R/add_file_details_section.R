#' Add a File Details section in README
#' If the README.md in the present working directory does not contain a "# File Details" heading, it is added in the end of it.
#' @importFrom readr read_lines
#' @export

add_file_details_section <-
    function() {
            readme <- readr::read_lines(file = "README.md")
        if (!("# File Details" %in% readme)) {
            cat("\n# File Details\n", file = "README.md", append = TRUE)
        }
    }
