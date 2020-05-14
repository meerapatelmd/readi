#' Set EtchASketch S4 Class


EtchASketch <- setClass("EtchASketch",
                        contains = c("Trace", "Bookmark"))

