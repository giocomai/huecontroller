#' Set temperature of light
#'
#' @param id If numeric, numeric id of light. If character, name of light. You can check id and names with `hue_get_lights_names()`
#' @param temperature A numeric value, or one of either "warmer" (or "+") or "colder" (or "-"). The warmest value available is usually 500, the coldest 153.
#' @param by Numeric, defaults to 10. Ignored if temperature is numeric. Otherwise determines the size of the increment/decrement.
#'
#' @return Silently returns http response from the bridge, but mostly used for its side effects.
#' @export
#'
#' @examples
hue_set_light_temperature <- function(id,
                                      temperature,
                                      by = 10) {
  if (is.numeric(temperature)) {
    hue_set_light_state(
      id = id,
      params = list(ct = temperature)
    )
  } else if (temperature == "warmer" | temperature == "+") {
    hue_set_light_state(
      id = id,
      params = list(ct_inc = by)
    )
  } else if (temperature == "colder" | temperature == "-") {
    hue_set_light_state(
      id = id,
      params = list(ct_inc = -by)
    )
  } else {
    usethis::ui_stop(x = 'Temperature must either be a numeric value, or one of either "warmer" (or "+") or "colder" (or "-")')
  }
}
