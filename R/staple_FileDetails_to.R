#' Attach FileDetails to the README.md and Destination File
#' @description As opposed to "add_" functions, "staple_" functions attach FileDetails to the README.md and destination file in the same function.
#' @importFrom secretary typewrite
#' @export

staple_FileDetails_to <-
    function(destination_file,
             sources,
             output_file,
             summary,
             ...,
             disable_rstudioapi = FALSE) {

        FileDetails_obj <-
        make_FileDetails(sources = sources,
                         output_file = output_file,
                         summary = summary,
                         ...,
                         disable_rstudioapi = disable_rstudioapi)


        ##Updating README
        add_README_entry(section_name = "File Details",
                         FileDetails_obj@text)

         if (grepl("[.]csv$", destination_file, ignore.case = TRUE) == TRUE) {

                    add_FileDetails_to_csv(FileDetails_obj = FileDetails_obj,
                                           path_to_csv = destination_file)

         } else if (grepl("[.]xlsx$", destination_file, ignore.case = TRUE) == TRUE) {

                    add_FileDetails_to_Excel(FileDetails_obj = FileDetails_obj,
                                             path_to_excel = destination_file)

         } else {
             secretary::typewrite("Readi only works on csv and xlsx files.")
         }
    }
