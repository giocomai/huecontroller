#' Change state of Hue lights
#'
#' @param id If numeric, numeric id of light. If charachter, name of light. You can check id and names with `hue_get_lights_names()`
#' @param params A named list. For a full list of available parameters, check https://developers.meethue.com/develop/hue-api/lights-api/
#'
#' @return
#' @export
#'
#' @examples
hue_set_state <- function(id,
                          params) {
  body_json <- jsonlite::toJSON(
    x = params,
    auto_unbox = TRUE
  )

  response <- httr::PUT(
    url = paste0(
      "http://",
      hue_settings()$hue_ip,
      "/api/",
      hue_settings()$hue_username,
      "/lights/",
      hue_output_id(id),
      "/state"
    ),
    body = body_json
  )

  invisible(response)
}
