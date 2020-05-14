#' Make a FileDetails class object
#' @importFrom dplyr transmute
#' @importFrom dplyr bind_rows
#' @importFrom dplyr select
#' @export


make_FileDetails <-
    function(sources,
             output_file,
             summary,
             disable_rstudioapi = FALSE) {

        output <- new("FileDetails",
                      standard = make_StandardFileDetailsDF(sources = sources,
                                                            output_file = output_file,
                                                            summary = summary,
                                                            disable_rstudioapi = disable_rstudioapi))

        if (!missing(...)) {
                output@add_on <-
                    make_AddOnFileDetailsDF(...)
        }

        notes_df <- view_notes()
        if (!is.null(notes_df)) {
                    output@notes <-
                        tibble::tibble(Topic = "Notes:",
                                       Details = notes_df %>%
                                dplyr::transmute(Notes = paste0(Timestamp, "\t", Note, "\n")) %>%
                                unlist()
                        )
        }

        output@text <-
                        dplyr::bind_rows(output@standard,
                                         output@add_on,
                                         output@notes
                                         ) %>%
                        dplyr::transmute(Readme = paste0(Topic, ":\t", Details)) %>%
                        dplyr::select(Readme) %>%
                        unlist() %>%
                        unname()
        return(output)
    }






