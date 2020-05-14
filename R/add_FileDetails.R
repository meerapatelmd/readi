#' Create a Readi
#' @description A Readi is an S4 object that contains a dataframe of File Details elements pertaining to a specific csv or Excel file os well as the entire README contents of the working directory. This function makes a new Readi S4 Class object using the given parameters.
#' This is first achived by:
#' 1. Making a README.md in the working directory if one does not exist, followed by:
#' 2. Adding a File Details section in the README if that does not exist.
#' @importFrom readr read_lines
#' @export

add_FileDetails <-
    function(sources, output_file, summary, ..., disable_rstudioapi = FALSE) {
        ##Getting README object to add FileDetails to
        README_obj <- make_README(section_name = "File Details")

        # readi_df <- make_readi_df(Sources = sources,
        #                           "Output File" = output_file,
        #                           Summary = summary,
        #                           ...,
        #                           disable_rstudioapi = disable_rstudioapi)


        notes_df <- view_notes()
        if (!is.null(notes_df)) {
            notes <-
            notes_df %>%
                dplyr::transmute(Notes = paste0(Timestamp, "\t", Note, "\n")) %>%
                unlist()

            readi_df <- make_readi_df(Sources = sources,
                                      "Output File" = output_file,
                                      Summary = summary,
                                      Notes = notes,
                                      ...,
                                      disable_rstudioapi = disable_rstudioapi)
        } else {
            readi_df <- make_readi_df(Sources = sources,
                                      "Output File" = output_file,
                                      Summary = summary,
                                      ...,
                                      disable_rstudioapi = disable_rstudioapi)
        }

    }
