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
  ns <- NS(id)
  current_light <- hue_get_light_state(id = light)  
  tagList(
    fluidRow(style = "border: 2px solid #375a7f;padding:10px;margin:10px;border-radius:25px;",
             
             h4(current_light$name),
             hidden(textInput(inputId = NS(id, "light"),
                              label = "Current light",
                              value = current_light$name)),
             shinyWidgets::switchInput(inputId = NS(id, "onoff"),
                                       label = "",
                                       value = current_light$state$on,
                                       width = "100%"),
             sliderInput(inputId = NS(id, "brightness"),
                         label = "Brightness",
                         min = 0,
                         max = 254,
                         value = current_light$state$bri), 
             sliderInput(inputId = NS(id, "temperature"),
                         label = "Temperature",
                         min = current_light$capabilities$control$ct$min,
                         max = current_light$capabilities$control$ct$max,
                         value = current_light$state$ct))
    
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
  moduleServer(id, function(input, output, session) {
    observeEvent(input$brightness, {
      huecontroller::hue_set_light_brightness(id = input$light,
                                              brightness = input$brightness)
    })
    
    observeEvent(input$temperature, {
      huecontroller::hue_set_light_temperature(id = input$light,
                                               temperature = input$temperature)
    })
    
    observeEvent(input$onoff, {
      if (input$onoff==TRUE) {
        huecontroller::hue_turn_on(id = input$light)
      } else if (input$onoff==FALSE) {
        huecontroller::hue_turn_off(id = input$light)
      }
    })
    
  }) 
}

