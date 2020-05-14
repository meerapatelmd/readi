#' Create a new section in README
#' If the README.md in the present working directory does not contain a section with the heading in the format of "# {section_name}", it is added in the end of it.
#' @importFrom readr read_lines
#' @param section_name name of the section, excluding the "# " prefix
#' @export

new_readme_section <-
    function(section_name) {
            create_readme()
            readme <- readr::read_lines(file = "README.md")
            heading <- paste0("# ", section_name)
        if (!(heading %in% readme)) {
            cat(paste0("\n", heading, "\n"), file = "README.md", append = TRUE, sep = "\n")
        }
    }
