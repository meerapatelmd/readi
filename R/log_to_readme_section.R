#' Log to a README by section
#' @description This function differs from write_to_readme_section by the structure of the entry. This function writes the entries in a tab-separated format as seen in other logs while write_to_readme_section writes a single entry in a more human readable format.
#' @importFrom readr read_lines
#' @importFrom cave present_script_path
#' @export

log_to_readme_section <-
    function(section_name, entry) {

        ##Making sure the 2 prerequisites for a Readi object are present:
        ##1. README in the working directory
                    create_readme()
        ##2. # Headeer for the section section in the README
                    new_readme_section(section_name = section_name)


        ##Creating the heading for the section
         heading <- paste0("# ", section_name)

        #Reading README
        readme <- readr::read_lines(file = "README.md")

        #Pinpointing starting line of File Details
        starting_line <- grep(heading, readme)

        #Splitting File Details into 3 sections: top, middle, and bottom.
        top_part <- readme[1:starting_line]

        if (starting_line < length(readme)) {
            bottom_part <- readme[(starting_line+1):length(readme)]
        } else {
            bottom_part <- "\n"
        }

        ##Writing middle part
        middle_part <- paste0(stampede::stamp_this(), "\t", entry, " from ", cave::present_script_path(), "  ")

        ##New readme
        new_readme <- c(top_part,
                        middle_part,
                        bottom_part)

        readr::write_lines(new_readme,
                           path = "README.md",
                           sep = "\n")
    }
