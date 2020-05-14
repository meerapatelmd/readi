#' Write a README.md in the working directory if it doesn't exist
#' @importFrom readr read_lines
#' @importFrom stampede stamp_this
#' @export

create_README.md <-
    function() {
        if (!file.exists("README.md")) {
            readme_heading <- to_heading(cave::strip_fn(getwd()))
            readr::write_lines(readme_heading, path = "README.md")
        }
    }
