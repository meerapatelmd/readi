#' Takes a Readi Object and makes the changes to the provided arguments
#' @importFrom secretary typewrite
#' @export

cast_readi_object <-
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
