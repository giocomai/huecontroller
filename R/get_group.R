
#' Get names of available groups
#'
#' @return
#' @export
#'
#' @examples
hue_get_groups_names <- function() {
  group_request <- httr::GET(paste0("http://",
                                    hue_settings()$hue_ip, "/api/",
                                    hue_settings()$hue_username, "/groups"))
  
  groups_l <- httr::content(x = group_request,
                            as = "parsed",
                            encoding = "UTF8")
  
  purrr::map_chr(groups_l,
                 purrr::pluck,
                 "name")
}

#' Get state of given group
#'
#' @param id If numeric, numeric id of group. If charachter, name of group. You can check id and names with `hue_get_groups_names()`

#'
#' @return A list with details on the state and attribute of the given group
#' @export
#'
#' @examples
hue_get_group_state <- function(id) {
  group_request <- httr::GET(paste0("http://",
                                    hue_settings()$hue_ip, "/api/",
                                    hue_settings()$hue_username, "/groups/", hue_output_group_id(id)))
  
  groups_l <- httr::content(x = group_request,
                            as = "parsed",
                            encoding = "UTF8")
  
  groups_l
}

#' Get state of given group
#'
#' @param id If numeric, numeric id of group. If charachter, name of group. You can check id and names with `hue_get_groups_names()`

#'
#' @return An integer vector with id of lights included in a group.
#' @export
#'
#' @examples
hue_get_group_lights <- function(id) {
  hue_get_group_state(id) %>% 
    purrr::pluck("lights") %>%
    as.integer()
}