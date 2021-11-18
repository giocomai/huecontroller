#' Set brightness of light
#'
#' @param id If numeric, numeric id of light. If character, name of light. You can check id and names with `hue_get_lights_names()`
#' @param brightness A numeric value, or one of either "brighter" (or "+") or "darker" (or "-"). The highest value is 254, the lowest 1.
#' @param by Numeric, defaults to 10. Ignored if brightness is numeric. Otherwise determines the size of the increment/decrement.
#'
#' @return Silently returns http response from the bridge, but mostly used for its side effects.
#' @export
#'
#' @examples
hue_set_light_brightness <- function(id,
                                     brightness,
                                     by = 10) {
  if (is.numeric(brightness)) {
    hue_set_light_state(
      id = id,
      params = list(bri = brightness)
    )
  } else if (brightness == "brighter" | brightness == "+") {
    hue_set_light_state(
      id = id,
      params = list(bri_inc = by)
    )
  } else if (brightness == "darker" | brightness == "-") {
    hue_set_light_state(
      id = id,
      params = list(bri_inc = -by)
    )
  } else {
    usethis::ui_stop(x = 'Brightness must either be a numeric value, or one of either "brighter" (or "+") or "darker" (or "-")')
  }
}


#' Set brightness of group
#'
#' @param id If numeric, numeric id of group. If character, name of group. You can check id and names with `hue_get_groups_names()`
#' @param brightness A numeric value, or one of either "brighter" (or "+") or "darker" (or "-"). The highest value is 254, the lowest 1.
#' @param by Numeric, defaults to 10. Ignored if brightness is numeric. Otherwise determines the size of the increment/decrement.
#'
#' @return Silently returns http response from the bridge, but mostly used for its side effects.
#' @export
#'
#' @examples
hue_set_group_brightness <- function(id,
                                     brightness,
                                     by = 10) {
  if (is.numeric(brightness)) {
    hue_set_group_state(
      id = id,
      params = list(bri = brightness)
    )
  } else if (brightness == "brighter" | brightness == "+") {
    hue_set_group_state(
      id = id,
      params = list(bri_inc = by)
    )
  } else if (brightness == "darker" | brightness == "-") {
    hue_set_group_state(
      id = id,
      params = list(bri_inc = -by)
    )
  } else {
    usethis::ui_stop(x = 'Brightness must either be a numeric value, or one of either "brighter" (or "+") or "darker" (or "-")')
  }
}
