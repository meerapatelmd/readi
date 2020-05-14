#' Delete the contents of a README section
#' @description Delete an entire section in a README
#' @export

delete_README_section <-
    function(section_name) {
                readme_obj <- make_README(section_name = section_name)
                readme_obj@section <- ""
                write_README(readme_obj)
    }

