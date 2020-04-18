#' Creates a README.md in the working directory if it doesn't exist
#' @importFrom readr read_lines
#' @export

create_readme <-
    function() {
        if (!file.exists("README.md")) {
            cat(stampede::stamp_this(), "\tFile Created\n", file = "README.md")
        }
    }
