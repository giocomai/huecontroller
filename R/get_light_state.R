#' Get light state
#'
#' @param id If numeric, numeric id of light. If character, name of light. You can check id and names with `hue_get_lights_names()`
#'
#' @return
#' @export
#'
#' @examples
hue_get_light_state <- function(id) {
  light_request <- httr::GET(paste0(
    "http://",
    hue_settings()$hue_ip,
    "/api/",
    hue_settings()$hue_username,
    "/lights/",
    hue_output_id(id)
  ))

  light_l <- httr::content(
    x = light_request,
    as = "parsed",
    encoding = "UTF8"
  )

  light_l
}
