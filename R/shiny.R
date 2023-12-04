#' Interactive interface to control lights
#'
#' options Options to be passed to the shiny app. See `?shiny::shinyApp()` for details.
#'
#' @return
#' @export
#'
#' @examples
hue_shiny_controller <- function(options = list()) {
  ui <- shiny::fluidPage(
    title = "huecontroller",
    shinyjs::useShinyjs(),
    theme = bslib::bs_theme(
      version = 4,
      bootswatch = "darkly"
    ),
    shiny::fluidRow(
      shiny::actionButton(
        inputId = "update_button",
        label = "Update",
        icon = shiny::icon(name = "sync"),
        style = "margin-left:10px;margin-right:10px;"
      ),

      # shiny::actionButton(inputId = "lights_or_groups_input",
      #                     label = "Lights or groups?",
      #                     style = "margin-left:10px;margin-right:10px;",
      #                     icon = shiny::icon(name = "lightbulb")),


      # shinyWidgets::radioGroupButtons(
      #   inputId = "light_group_selector",
      #   label = "Control lights or groups?",
      #   choices = c("Lights",
      #               "Groups"),
      #   selected = "Lights"
      # ),
      style = "border: 2px solid #375a7f;padding:10px;margin:10px;border-radius:25px;width:100%;"
    ),
    shiny::uiOutput(outputId = "cards_ui")
  )

  server <- function(input, output, session) {
    shiny::observeEvent(
      eventExpr = input$update_button,
      handlerExpr = {
        output$cards_ui <- shiny::renderUI({
          group_names_v <- hue_get_groups_names()

          shiny::tagList(
            purrr::map2(
              .x = group_names_v,
              .y = as.numeric(names(group_names_v)),
              .f = function(current_group,
                            current_group_id) {
                shiny::column(
                  width = 3,
                  shiny::h2(current_group),
                  purrr::map(
                    .x = hue_get_group_lights(id = current_group_id),
                    .f = function(x) {
                      current_light <- hue_get_light_state(id = x)
                      hue_mod_light_card_ui(
                        id = current_light$name,
                        light = current_light$name,
                        onoff = current_light$state$on,
                        brightness = current_light$state$bri,
                        temperature = current_light$state$ct,
                        min_temperature = current_light$capabilities$control$ct$min,
                        max_temperature = current_light$capabilities$control$ct$max
                      )
                    }
                  ) %>%
                    shiny::tagList() %>%
                    shiny::fluidRow()
                )
              }
            ) %>%
              fluidRow()
          )
        })
      }, ignoreNULL = FALSE
    )


    purrr::walk(
      .x = hue_get_lights_names(),
      .f = function(x) {
        hue_mod_light_card_server(id = x)
      }
    )
  }



  shiny::shinyApp(
    ui = ui,
    server = server,
    options = options
  )
}
