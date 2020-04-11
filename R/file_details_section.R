#' Creates a File Details section
#' @importFrom readr read_lines
#' @export

file_details_section <-
    function() {
        if (!file.exists("README.md")) {
            cat(stampede::stamp_this(), "\tFile Created\n", file = "README.md")
            readme <- readr::read_lines(file = "README.md")
        } else {
            readme <- readr::read_lines(file = "README.md")
        }

        if (!("# File Details" %in% readme)) {
            cat("\n# File Details\n", file = "README.md", append = TRUE)
        }
    }
