#' Interactive interface to control lights
#'
#' @return
#' @export
#'
#' @examples
hue_shiny_controller <- function() {
  ui <- shiny::fluidPage(
    title = "huecontroller",
    shinyjs::useShinyjs(),
    theme = bslib::bs_theme(
      version = 4,
      bootswatch = "darkly"
    ),
    purrr::map(
      .x = hue_get_groups_names(),
      .f = function(current_group) {
        shiny::flowLayout(
          shiny::h2(current_group),

          purrr::map(
            .x = hue_get_group_lights(id = current_group),
            .f = function(x) {
              light_name <- hue_get_light_state(id = x)$name
              hue_mod_light_card_ui(
                id = light_name,
                light = light_name
              )
            }
          ) %>%
            shiny::tagList() %>%
            shiny::fluidRow()
        )
      }
    )
  )

  server <- function(input, output, session) {
    purrr::walk(
      .x = hue_get_lights_names(),
      .f = function(x) {
        hue_mod_light_card_server(id = x)
      }
    )
  }

  shiny::shinyApp(ui, server)
}
