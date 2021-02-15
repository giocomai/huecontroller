#' Delete light
#'
#' @param id If numeric, numeric id of light. If charachter, name of light. You can check id and names with `hue_get_lights_names()`
#'
#' @return Silently returns http response from the bridge, but mostly used for its side effects.
#' @export
#'
#' @examples
hue_delete_light <- function(id) {
  check <- usethis::ui_yeah(x = paste0("Do you really want to delete the light ", id, "?"))
  if (check == TRUE) {
    response <- httr::DELETE(
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
  } else {
    usethis::ui_info("Operation cancelled")
  }
}

#' Delete group
#'
#' @param id If numeric, numeric id of group. If charachter, name of group You can check id and names with `hue_get_groups_names()`
#'
#' @return Silently returns http response from the bridge, but mostly used for its side effects.
#' @export
#'
#' @examples
hue_delete_group <- function(id) {
  check <- usethis::ui_yeah(x = paste0("Do you really want to delete the group ", id, "?"))
  if (check == TRUE) {
    response <- httr::DELETE(url = paste0(
      "http://",
      hue_settings()$hue_ip,
      "/api/",
      hue_settings()$hue_username,
      "/groups/",
      hue_output_group_id(id)
    ))
    invisible(response)
  } else {
    usethis::ui_info("Operation cancelled")
  }
}
