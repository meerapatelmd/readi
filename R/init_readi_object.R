#' Create a Readi object from arguments and an existing README
#' @importFrom readr read_lines
#' @importFrom tidyr separate
#' @importFrom dplyr tibble
#' @export

init_readi_object <-
    function(sources,
             summary,
             path_to_local_r_script,
             github_link_to_r_script,
             path_to_original_output_file,
             notes,
             log_details) {

        file_details_section()

        readme <- readr::read_lines(file = "README.md")
        starting_line <- grep("# File Details", readme)

        top_part <- readme[1:starting_line]

        if (starting_line < length(readme)) {
            bottom_part <- readme[(starting_line+1):length(readme)]
        } else {
            bottom_part <- "\n"
        }

        ##Writing middle part
        middle_part <- c(
            paste0("Timestamp:\t", stampede::stamp_this()),
            paste0("Data Sources:\t", sources),
            paste0("Summary:\t", summary),
            paste0("Local R Script:\t", path_to_local_r_script),
            paste0("GitHub Link:\t", github_link_to_r_script),
            paste0("Original Output File:\t", path_to_original_output_file),
            paste0("Notes:\t", notes),
            paste0("Log Details:\t", log_details))

        ##Creating a concurrent dataframe
        middle_part_df <-
            tibble(middle_part) %>%
            tidyr::separate(col = 1, sep = "[\t]", into = c("Topic", "Details"))

        ##New readme
        new_readme <- c(top_part,
                        middle_part,
                        bottom_part)

        set_readi_class()
        output <- new(Class = "Readi", dataframe = middle_part_df, readme = new_readme)

        return(output)
    }
