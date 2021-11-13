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
    shiny::fluidRow(
      shiny::actionButton(inputId = "update_button", label = "Update")
    ),
    
    
    shiny::uiOutput(outputId = "cards_ui")
    
  )
  
  server <- function(input, output, session) {
    shiny::observeEvent(
      eventExpr = input$update_button,
      handlerExpr = {
        
        output$cards_ui <- shiny::renderUI({
          shiny::tagList(
            purrr::map(
              .x = hue_get_groups_names(),
              .f = function(current_group) {
                shiny::column(
                  width = 3,
                  shiny::h2(current_group),
                  
                  purrr::map(
                    .x = hue_get_group_lights(id = current_group),
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
        
    }, ignoreNULL = FALSE)

    
    purrr::walk(
      .x = hue_get_lights_names(),
      .f = function(x) {
        hue_mod_light_card_server(id = x)
      }
    )
    
  }
  
  

  shiny::shinyApp(ui, server)
}
