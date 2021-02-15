#' UI function for shiny app
#'
#' @param id Module id
#' @param light Light id
#'
#' @return
#' @export
#'
#' @examples
hue_mod_light_card_ui <- function(id, light) {
  ns <- shiny::NS(id)
  current_light <- hue_get_light_state(id = light)
  shiny::tagList(
    shiny::fluidRow(
      style = "border: 2px solid #375a7f;padding:10px;margin:10px;border-radius:25px;",

      shiny::h4(current_light$name),
      shinyjs::hidden(shiny::textInput(
        inputId = shiny::NS(id, "light"),
        label = "Current light",
        value = current_light$name
      )),
      shinyWidgets::switchInput(
        inputId = shiny::NS(id, "onoff"),
        label = "",
        value = current_light$state$on,
        width = "100%"
      ),
      shiny::sliderInput(
        inputId = shiny::NS(id, "brightness"),
        label = "Brightness",
        min = 0,
        max = 254,
        value = current_light$state$bri
      ),
      shiny::sliderInput(
        inputId = shiny::NS(id, "temperature"),
        label = "Temperature",
        min = current_light$capabilities$control$ct$min,
        max = current_light$capabilities$control$ct$max,
        value = current_light$state$ct
      )
    )
  )
}

#' Server function for shiny app
#'
#' @param id Module id
#'
#' @return
#' @export
#'
#' @examples
hue_mod_light_card_server <- function(id) {
  shiny::moduleServer(id, function(input, output, session) {
    shiny::observeEvent(input$brightness, {
      huecontroller::hue_set_light_brightness(
        id = input$light,
        brightness = input$brightness
      )
    })

    shiny::observeEvent(input$temperature, {
      huecontroller::hue_set_light_temperature(
        id = input$light,
        temperature = input$temperature
      )
    })

    shiny::observeEvent(input$onoff, {
      if (input$onoff == TRUE) {
        huecontroller::hue_turn_on(id = input$light)
      } else if (input$onoff == FALSE) {
        huecontroller::hue_turn_off(id = input$light)
      }
    })
  })
}
