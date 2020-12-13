#' Turn on light
#'
#' @param id If numeric, numeric id of light. If charachter, name of light. You can check id and names with `hue_get_lights_names()`
#'
#' @return Silently returns http response from the bridge, but mostly used for its side effects.
#' @export
#'
#' @examples
hue_turn_on <- function(id) {
  invisible(hue_set_state(id = id,
                   params = list(on = TRUE)))
}


#' Turn off light
#'
#' @param id If numeric, numeric id of light. If charachter, name of light. You can check id and names with `hue_get_lights_names()`
#'
#' @return Silently returns http response from the bridge, but mostly used for its side effects.
#' @export
#'
#' @examples
hue_turn_off <- function(id) {
  invisible(hue_set_state(id = id,
                             params = list(on = FALSE)))
}
