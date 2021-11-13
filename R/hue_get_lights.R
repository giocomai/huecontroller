#' Get details about all lights
#'
#' @return A list with details about all lights
#' @export
#'
#' @examples
hue_get_lights <- function() {
  lights_request <- httr::GET(paste0(
    "http://",
    hue_settings()$hue_ip, "/api/",
    hue_settings()$hue_username, "/lights"
  ))
  
  lights_l <- httr::content(
    x = lights_request,
    as = "parsed",
    encoding = "UTF8"
  )
  
  lights_l
}
