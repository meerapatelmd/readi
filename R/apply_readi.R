#' Takes a Readi Class object and updates the README.md File Details section with the new file details as well as attaches it to the provided csv or Excel file.
#' @importFrom secretary typewrite
#' @export

apply_readi <-
    function(file, readi_object) {
        update_readme(readi_object = readi_object)

         if (grepl("[.]csv$", file, ignore.case = TRUE) == TRUE) {

                    attach_to_csv(readi_object = readi_object,
                                  path_to_csv = file)

         } else if (grepl("[.]xlsx$", file, ignore.case = TRUE) == TRUE) {

                    update_excel(path_to_excel = file,
                                 readi_object = readi_object)

         } else {
             secretary::typewrite("Readi only works on csv and xlsx files.")
         }
    }
