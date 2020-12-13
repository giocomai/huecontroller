#' Get names of all available lights
#'
#' @return
#' @export
#'
#' @examples
hue_get_lights_names <- function() {
  lights_request <- httr::GET(paste0("http://",
                                     hue_settings()$hue_ip, "/api/",
                                     hue_settings()$hue_username, "/lights"))

  lights_l <- httr::content(x = lights_request,
                            as = "parsed",
                            encoding = "UTF8")

  purrr::map_chr(lights_l,
                 purrr::pluck,
                 "name")
}
