#' Create a File Details Dataframe
#' @importFrom rubix map_names_set
#' @importFrom tibble tibble
#' @param disable_rstudioapi TRUE if the RStudioAPI should be disabled. Errors can be thrown in Jobs and running scripts from the command line.
#' @export

make_StandardFileDetailsDF <-
    function(sources, output_file, summary, disable_rstudioapi = FALSE) {

        ##Making standard components
        ##Getting GitHub link if there isn't a remote, returns a message say so
        github_link <- glitter::remote_url()
        if (length(github_link) == 0) {
            github_link <- paste0("No remote associated with working directory '", getwd(), "'")
        }

        if (disable_rstudioapi == FALSE) {
            Standards <- list(Timestamp = stampede::stamp_this(),
                              `R Script` = cave::present_script_path(),
                              `GitHub Link` = github_link,
                              Sources = sources,
                              Output = output_file,
                              Summary = summary
            )
        } else {
            Standards <- list(Timestamp = stampede::stamp_this(),
                              `GitHub Link` = github_link,
                              Sources = sources,
                              Output = output_file,
                              Summary = summary
            )
        }




        return(tibble::tibble(Topic = names(Standards),
                                            Details = unlist(Standards)))
    }


test_ellipsis <-
    function(...) {
        print(...)
    }
