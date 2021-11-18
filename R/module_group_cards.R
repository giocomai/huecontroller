#' UI function for shiny app
#'
#' @param id Module id
#' @param group Group id
#'
#' @return
#' @export
#'
#' @examples
hue_mod_group_card_ui <- function(id,
                                  group,
                                  onoff,
                                  brightness,
                                  temperature,
                                  min_temperature,
                                  max_temperature) {
  ns <- shiny::NS(id)
  shiny::tagList(
    shiny::fluidRow(
      style = "border: 2px solid #375a7f;padding:10px;margin:10px;border-radius:25px;width:100%;",

      shiny::h4(group),
      shinyjs::hidden(shiny::textInput(
        inputId = shiny::NS(id, "group"),
        label = "Current group",
        value = group
      )),
      shinyWidgets::switchInput(
        inputId = shiny::NS(id, "onoff"),
        label = "",
        value = onoff,
        width = "100%"
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
hue_mod_group_card_server <- function(id) {
  shiny::moduleServer(id, function(input, output, session) {
    shiny::observeEvent(input$brightness, {
      huecontroller::hue_set_group_brightness(
        id = input$group,
        brightness = input$brightness
      )
    })

    shiny::observeEvent(input$temperature, {
      huecontroller::hue_set_group_temperature(
        id = input$group,
        temperature = input$temperature
      )
    })

    shiny::observeEvent(input$onoff, {
      if (input$onoff == TRUE) {
        huecontroller::hue_turn_group_on(id = input$group)
      } else if (input$onoff == FALSE) {
        huecontroller::hue_turn_group_off(id = input$group)
      }
    })
  })
}
