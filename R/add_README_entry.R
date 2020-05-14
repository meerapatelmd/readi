#' Add a an entry to README.md section
#' @importFrom readr read_lines
#' @param section_name name of the new section, excluding the "# " prefix
#' @param ... comma-separated character lines that will be appended to the README
#' @export

add_README_entry <-
    function(section_name, ...) {
            README_obj <- make_README(section_name = section_name)
            README_obj@section <-
                c(README_obj@section, ...)

            write_README(README_object = README_obj)
    }
