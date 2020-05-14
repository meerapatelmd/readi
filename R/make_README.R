#' Make a README Class object
#' @description This function takes the README.md in the working directory and converts it into a README class object
#' @param section_name This is the name of the README.md section to perform the split into 3 on. The argument should only be the complete string of the section heading for the README.md. For example for the "# File Details", the section_name would be "File Details". Since the heading can be followed by either carriage returns or spaces depending on the style of markdown, an exact string match is not used when splitting the README.md read_lines vector. Should there be more than 1 match, the first index returned by the grep function is used to perform the split. The "after_section" slot is determined by the next match to the regular expresion "^[#] .*$".
#' @importFrom readr read_lines
#' @export

make_README <-
    function(section_name) {
            ##Conditional creations of file and section
            ##Creating a README.md if it doesn't exist
            create_README.md()
            ##Adding a README section if it doesn't exist
            add_README_section(section_name = section_name)

            ##Creating README Class object with slots to fill up
            output <- new(Class = "README")


            ##Reading file
            readme <- readr::read_lines(file = "README.md")
            ##Trimming whitespae on the right, and 2 spaces and a carriage return will be added at the writing stage
            readme <- trimws(readme, which = "right")

            ##Filling section_headings slot
            output@section_headings <- grep("^[#]{1} .*$", readme, value = TRUE)


            ##Filing before_section slot
            #Pinpointing starting line of section from section heading
            section_heading <- to_heading(section_name = section_name)
            starting_line <- grep(section_heading, readme)[1]

            if (starting_line < 3) {

                    ##Pinpointing the end of the next section
                    ending_line <- grep("^[#]{1} .*$", readme)[2]
            } else {
                    output@before_section <- readme[1:(starting_line-1)]

                    ##The top part is broken off the rest of the readme object
                    readme <- readme[-(1:(starting_line-1))]

                    ##Pinpointing the end of the next section
                    ending_line <- grep("^[#]{1} .*$", readme[-1])
            }


            if (length(ending_line) == 0) {
                    output@section <- readme
            } else {
                    output@section <- readme[1:(ending_line-1)]
                    output@after_section <- readme[ending_line:length(readme)]

            }

            return(output)

    }

