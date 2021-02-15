#' Set IP and username to interact with the api
#'
#' @param ip A charachter vector of length one. The IP of your hue bridge, e.g. "192.168.0.1"
#' @param username A username generated to interact with the API. For details, https://developers.meethue.com/develop/get-started-2/
#'
#' @return
#' @export
#'
#' @examples
hue_settings <- function(ip = NULL,
                         username = NULL) {
  if (is.null(ip)) {
    ip <- Sys.getenv("hue_ip")
    if (ip == "") {
      usethis::ui_stop("IP of the HUE bridge must be given")
    }
  } else {
    Sys.setenv(hue_ip = ip)
    usethis::ui_done(x = "Hue bridge IP set")
  }

  if (is.null(username)) {
    username <- Sys.getenv("hue_username")
    if (username == "") {
      usethis::ui_stop("Username must be given")
    }
  } else {
    Sys.setenv(hue_username = username)
    usethis::ui_done(x = "Username set")
  }

  invisible(list(
    hue_ip = ip,
    hue_username = username
  ))
}
