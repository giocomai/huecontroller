#' Turn on light
#'
#' @param id If numeric, numeric id of light. If character, name of light. You can check id and names with `hue_get_lights_names()`
#'
#' @return Silently returns http response from the bridge, but mostly used for its side effects.
#' @export
#'
#' @examples
hue_turn_light_on <- function(id) {
  invisible(hue_set_light_state(
    id = id,
    params = list(on = TRUE)
  ))
}


#' Turn off light
#'
#' @param id If numeric, numeric id of light. If character, name of light. You can check id and names with `hue_get_lights_names()`
#'
#' @return Silently returns http response from the bridge, but mostly used for its side effects.
#' @export
#'
#' @examples
hue_turn_light_off <- function(id) {
  invisible(hue_set_light_state(
    id = id,
    params = list(on = FALSE)
  ))
}


#' Turn on group
#'
#' @param id If numeric, numeric id of group. If character, name of group. You can check id and names with `hue_get_groups_names()`
#'
#' @return Silently returns http response from the bridge, but mostly used for its side effects.
#' @export
#'
#' @examples
hue_turn_group_on <- function(id) {
  invisible(hue_set_group_state(
    id = id,
    params = list(on = TRUE)
  ))
}


#' Turn off group
#'
#' @param id If numeric, numeric id of group. If character, name of group. You can check id and names with `hue_get_groups_names()`
#'
#' @return Silently returns http response from the bridge, but mostly used for its side effects.
#' @export
#'
#' @examples
hue_turn_group_off <- function(id) {
  invisible(hue_set_group_state(
    id = id,
    params = list(on = FALSE)
  ))
}
