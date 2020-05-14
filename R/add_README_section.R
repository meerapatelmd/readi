#' Add a section to README.md if it does not already exist
#' If the README.md in the present working directory does not contain a section with the heading in the format of "# {section_name}", it is added to it at the bottom.
#' @importFrom readr read_lines
#' @param section_name name of the new section, excluding the "# " prefix
#' @export

add_README_section <-
    function(section_name) {
            readme <- readr::read_lines(file = "README.md")
            new_section_heading <- to_heading(section_name)

            if (any(grepl(new_section_heading, readme) == TRUE) == FALSE) {
                    README_obj <- new(Class = "README",
                                      before_section = readme,
                                      section = new_section_heading)

                    write_README(README_object = README_obj)
            }
    }
