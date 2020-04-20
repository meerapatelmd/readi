#' Create a Readi
#' @description A Readi is an S4 object that contains a dataframe of File Details elements pertaining to a specific csv or Excel file os well as the entire README contents of the working directory. This function makes a new Readi S4 Class object using the given parameters.
#' This is first achived by:
#' 1. Making a README.md in the working directory if one does not exist, followed by:
#' 2. Adding a File Details section in the README if that does not exist.
#' @importFrom readr read_lines
#' @importFrom tidyr separate
#' @importFrom dplyr tibble
#' @importFrom cave present_script_path
#' @importFrom glitter remote_url
#' @export

mk_readi <-
    function(sources,
             summary,
             path_to_original_output_file,
             notes) {

        ##Making sure the 2 prerequisites for a Readi object are present:
        ##1. README in the working directory
                    create_readme()
        ##2. File Details section in the README
                    add_file_details_section()


        #Reading README
        readme <- readr::read_lines(file = "README.md")

        #Pinpointing starting line of File Details
        starting_line <- grep("# File Details", readme)

        #Splitting File Details into 3 sections: top, middle, and bottom.
        top_part <- readme[1:starting_line]

        if (starting_line < length(readme)) {
            bottom_part <- readme[(starting_line+1):length(readme)]
        } else {
            bottom_part <- "\n"
        }

        ##Getting GitHub link if there isn't a remote, returns a message say so
        github_link <- glitter::remote_url()
        if (length(github_link) == 0) {
            github_link <- paste0("No remote associated with working directory '", getwd(), "'")
        }

        ##Writing middle part
        middle_part <- c(
            paste0("Timestamp:\t", stampede::stamp_this()),
            paste0("Data Sources:\t", sources),
            paste0("Summary:\t", summary),
            paste0("Local R Script:\t", cave::present_script_path()),
            paste0("GitHub Link:\t", github_link),
            paste0("Original Output File:\t", path_to_original_output_file),
            paste0("Notes:\t", notes))

        ##Creating a concurrent dataframe
        middle_part_df <-
            tibble(middle_part) %>%
            tidyr::separate(col = 1, sep = "[\t]", into = c("Topic", "Details"))

        ##New readme
        new_readme <- c(top_part,
                        middle_part,
                        bottom_part)

        output <- new(Class = "Readi", dataframe = middle_part_df, readme = new_readme)

        return(output)
    }
