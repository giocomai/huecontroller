#' Title
#'
#' @param id If numeric, numeric id of light. If charachter, name of light. You can check id and names with `hue_get_lights_names()`
#'
#' @return Always return an integer corresponding to a given light.
#' @export
#'
#' @examples
hue_output_id <- function(id) {
  if (is.numeric(id)==TRUE) {
    return(id)
  } else {
    id_number <- which(hue_get_lights_names()==id)
    if (length(id_number)==0) {
      usethis::ui_stop("id must either be an integer or the exact name of an existing light")
    } else {
      return(as.numeric(names(id_number)))
    }
  }
}
