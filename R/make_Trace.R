#' Make a Trace S4 Class Object
#' @importFrom stampede stamp_this
#' @importFrom cave present_script_path
#' @export

make_Trace <-
    function(objname_pattern, disable_rstudioapi = FALSE) {
                output <- trace_objects(objname_pattern = objname_pattern)
                Trace_obj <- new("Trace")

                Trace_obj@trace_dataframe <- tibble::tibble(output)
                Trace_obj@trace_timestamp <- stampede::stamp_this()

                if (disable_rstudioapi == FALSE) {
                    Trace_obj@r_script <- cave::present_script_path()
                }

                return(Trace_obj)
    }
