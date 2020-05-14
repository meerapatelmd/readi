#' Set EtchASketch S4 Class
#' @export EtchASketch
#' @exportClass EtchASketch

EtchASketch <- setClass("EtchASketch",
                        contains = c("Trace", "Bookmark"))

