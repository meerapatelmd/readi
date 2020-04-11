#' Update README.md in working directory from a Readi obj
#' @export

update_readme <-
    function(readi_object) {
        cat(readi_object@readme, file = "README.md", sep = "\n")
    }
