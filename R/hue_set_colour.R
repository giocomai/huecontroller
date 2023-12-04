#' Convert hex colour to
#'
#' @param colour A colour name as listed by `colours()` or a hexadecimal colour string.
#'
#' @return A named list with two elements: `hue` and `sat`
#' @export
#'
#' @examples
#'
#' hue_convert_to_hue_sat("red")
#' hue_convert_to_hue_sat("#E414FF")
#' if (interactive()) {
#'   hue_convert_to_hue_sat(colourpicker::colourPicker(numCols = 1))
#' }
hue_convert_to_hue_sat <- function(colour) {
  list(
    hue = round(rgb2hsv(col2rgb(colour))[1] * 65535),
    sat = round(rgb2hsv(col2rgb(colour))[2] * 255)
  )
}



#' Set colour of a Hue light with relevant capabilities
#'
#' N.B. Colour accuracy may not be perfect. See the official documentation for details, and consider using custom parameters with `hue_set_light_state()` if this function does not achieve what you expect. https://developers.meethue.com/develop/application-design-guidance/color-conversion-formulas-rgb-to-xy-and-back/
#'
#' @param id If numeric, numeric id of light. If character, name of light. You can check id and names with `hue_get_lights_names()`
#' @param colour A colour name as listed by `colours()` or a hexadecimal colour string.
#' @param transition_time Duration of the transition in seconds. Defaults to 0.4 seconds.
#'
#' @return
#' @export
#'
#' @examples
#'
#' if (interactive()) {
#'   hue_set_light_colour(id = 11, colour = "blue")
#' }
#'
hue_set_light_colour <- function(id,
                                 colour,
                                 transition_time = 0.4) {
  hue_set_light_state(
    id = id,
    params = c(hue_convert_to_hue_sat(colour),
      transitiontime = transition_time * 10
    )
  )
}


#' Set colour of a group of lights with relevant capabilities
#'
#' N.B. Colour accuracy may not be perfect. See the official documentation for details, and consider using custom parameters with `hue_set_group_state()` if this function does not achieve what you expect. https://developers.meethue.com/develop/application-design-guidance/color-conversion-formulas-rgb-to-xy-and-back/
#'
#' @param id If numeric, numeric id of light. If character, name of light. You can check id and names with `hue_get_groups_names()`
#' @param colour A colour name as listed by `colours()` or a hexadecimal colour string.
#' @param transition_time Duration of the transition in seconds. Defaults to 0.4 seconds.
#'
#' @return
#' @export
#'
#' @examples
#'
#' if (interactive()) {
#'   hue_set_group_colour(id = 11, colour = "green")
#' }
hue_set_group_colour <- function(id,
                                 colour,
                                 transition_time = 0.4) {
  hue_set_group_state(
    id = id,
    params = c(hue_convert_to_hue_sat(colour),
      transitiontime = transition_time * 10
    )
  )
}
