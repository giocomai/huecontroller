#' Change state of Hue lights
#'
#' @param id If numeric, numeric id of light. If character, name of light. You can check id and names with `hue_get_lights_names()`
#' @param params A named list. For a full list of available parameters, check https://developers.meethue.com/develop/hue-api/lights-api/
#'
#' @return
#' @export
#'
#' @examples
hue_set_light_state <- function(id,
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


#' Change state of Hue groups
#'
#' @param id If numeric, numeric id of group. If character, name of group. You can check id and names with `hue_get_groups_names()`
#' @param params A named list. For a full list of available parameters, check https://developers.meethue.com/develop/hue-api/groupds-api/
#'
#' @return
#' @export
#'
#' @examples
hue_set_group_state <- function(id,
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
      "/groups/",
      hue_output_group_id(id),
      "/action"
    ),
    body = body_json
  )

  invisible(response)
}
