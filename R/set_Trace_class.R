#' Set the Trace S4 Object Class
#' @export Trace
#' @exportClass Trace

Trace <- setClass("Trace",
                  representation(trace_timestamp = "character",
                                 r_script = "character",
                                 trace_dataframe = "tbl_df"))
