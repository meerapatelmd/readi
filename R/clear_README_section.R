#' Clear the contents of a README section
#' @description Clear all the lines in a section, but keep the section_heading
#' @export

clear_README_section <-
    function(section_name) {
                readme_obj <- make_README(section_name = section_name)
                readme_obj@section <- readme_obj@section[1]
                return(readme_obj)
    }
