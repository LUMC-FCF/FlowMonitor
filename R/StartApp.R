#' StartApp
#'
#' @description
#' Starts the RShiny application
#'
#' @export
StartApp <- function() {
  appDir <- system.file("myapp", "AppFiles", package = "FlowMonitorApp")
  if (appDir == "") {
    stop("Could not find example directory. Try re-installing `mypackage`.", call. = FALSE)
  }

  shiny::runApp(appDir)
}


