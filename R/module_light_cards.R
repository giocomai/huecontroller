#' UI function for shiny app
#'
#' @param id Module id
#' @param light Light id
#'
#' @return
#' @export
#'
#' @examples
hue_mod_light_card_ui <- function(id,
                                  light,
                                  onoff,
                                  brightness,
                                  temperature,
                                  min_temperature,
                                  max_temperature) {
  ns <- shiny::NS(id)

  if (is.null(temperature)) {
    temperature <- 0
    min_temperature <- 0
    max_temperature <- 0
  }
  shiny::tagList(
    shiny::fluidRow(
      style = "border: 2px solid #375a7f;padding:10px;margin:10px;border-radius:25px;width:100%;",
      shiny::h4(light),
      shiny::fluidRow(
        style = "width:100%;margin-left:0px;",
        shinyWidgets::switchInput(
          inputId = shiny::NS(id, "onoff"),
          label = "",
          value = onoff,
          inline = FALSE,
          handleWidth = 60,
          labelWidth = 40
        )
      ),
      shiny::sliderInput(
        inputId = shiny::NS(id, "brightness"),
        label = "Brightness",
        min = 0,
        max = 254,
        value = brightness,
        width = "100%"
      ),
      shiny::sliderInput(
        inputId = shiny::NS(id, "temperature"),
        label = "Temperature",
        min = min_temperature,
        max = max_temperature,
        value = temperature,
        width = "100%"
      ),
      shinyjs::hidden(shiny::textInput(
        inputId = shiny::NS(id, "light"),
        label = "Current light",
        value = light
      ))
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
        huecontroller::hue_turn_light_on(id = input$light)
      } else if (input$onoff == FALSE) {
        huecontroller::hue_turn_light_off(id = input$light)
      }
    })
  })
}
