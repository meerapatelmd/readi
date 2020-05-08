#' Create a Readi
#' @description A Readi is an S4 object that contains a dataframe of File Details elements pertaining to a specific csv or Excel file os well as the entire README contents of the working directory. This function makes a new Readi S4 Class object using the given parameters.
#' This is first achived by:
#' 1. Making a README.md in the working directory if one does not exist, followed by:
#' 2. Adding a File Details section in the README if that does not exist.
#' @importFrom readr read_lines
#' @export

make_readi <-
    function(sources, output_file, summary, ..., disable_rstudioapi = FALSE) {

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

        readi_df <- make_readi_df(sources,
                                  output_file,
                                  summary,
                                  ...,
                                  disable_rstudioapi = disable_rstudioapi)


        ##Writing middle part
        middle_part <- make_readi_readme(readi_df = readi_df)

        ##New readme
        new_readme <- c(top_part,
                        middle_part,
                        bottom_part)

        output <- new(Class = "Readi", dataframe = readi_df, readme = new_readme)

        return(output)
    }
