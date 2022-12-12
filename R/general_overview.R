general_overview_UI <- function(id) {
  ns <- NS(id)
  tagList(div(
    id = 'page' ,

    fluidRow(id = 'header',
             column(
               width = 12,
               id = "tela_1_tabset_1",
               # style = "height: fit-content; ",
               div(
                 id = "panel_header",
                 class = "update",
                 h3(class = "panel_title",
                    # tags$img(src = "www/img/models_icon.svg", width = '24px', height = "24px"),

                    paste0("General Overview"))
               ),

               div(
                 id  = 'select_inputs_div',

                 shiny::selectInput(
                   inputId = ns("select_country"),
                   label = "Select Model",
                   # choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3),
                   choices = c("Africa", "Americas", "Asia", "Europe", "Oceania"),
                   selected = "Africa"
                 ),

                 shinyWidgets::prettyRadioButtons(
                   inputId = ns("vars_choice"),
                   label = "",
                   choices = c('lifeExp','pop','gdpPercap'),
                   selected = 'lifeExp',
                   inline = TRUE,
                   status = "success",
                   fill = TRUE
                 ),


                 div(
                   class = "date_slider",

                   shinyWidgets::sliderTextInput(
                     inputId =  ns("slider_new"),
                     label = "Projections Range",

                     choices = c(seq(1952, 2007, 5)),
                     selected = '2007'

                   )
                 )
               )
             )),

    fluidRow(id  = 'second_row',
             column(
               width = 12,
               id  = 'years_chart',

               wellPanel(class = 'split_chart',
                         style  = 'border:2px double; ',
                         htmlOutput(ns('title')),
                         htmlOutput(ns('chart_1')))
             ))
  ))
}

general_overview_Server <- function(id) {
  moduleServer(id,
               function(input, output, session) {

                 data_chart <- reactive({
                   if (input$select_country == 'Africa') {
                     continents_charts_list$Africa[[input$vars_choice]]

                   } else{
                     if (input$select_country == 'Americas') {
                       continents_charts_list$Americas[[input$vars_choice]]

                     } else{
                       if (input$select_country == 'Asia') {
                         continents_charts_list$Asia[[input$vars_choice]]

                       } else{
                         if (input$select_country == 'Europe') {
                           continents_charts_list$Europe[[input$vars_choice]]


                         } else{
                           continents_charts_list$Oceania[[input$vars_choice]]

                         }
                       }
                     }


                   }
                 }) %>% bindCache(input$vars_choice)

                 output$chart_1 <- renderUI({

                     if (input$slider_new[1] == "1952") {
                       #
                       div(style = 'display: flex;     flex-wrap: wrap;     justify-content: center;',
                           h2(class = 'split_chart_title',glue::glue('Continent by Years: {paste0(input$select_country)} - { input$vars_choice}' ),
                              tags$img(src = paste0("www/img/",input$vars_choice,".svg"))),

                           data_chart()[1])
                     } else{
                       if (input$slider_new[1] == "1957") {
                         div(style = 'display: flex;     flex-wrap: wrap;     justify-content: center;',
                             h2(class = 'split_chart_title',glue::glue('Continent by Years: {paste0(input$select_country)} - { input$vars_choice}'),
                                tags$img(src = paste0("www/img/",input$vars_choice,".svg"))),

                             data_chart()[1:2])

                       } else{
                         if (input$slider_new[1] == "1962") {
                           div(style = 'display: flex;     flex-wrap: wrap;     justify-content: center;',
                               h2(class = 'split_chart_title',glue::glue('Continent by Years: {paste0(input$select_country)} - { input$vars_choice}'),
                                  tags$img(src = paste0("www/img/",input$vars_choice,".svg"))),
                               data_chart()[1:3])

                         } else{
                           if (input$slider_new[1] == "1967") {
                             div(style = 'display: flex;     flex-wrap: wrap;     justify-content: center;',
                                 h2(class = 'split_chart_title',glue::glue('Continent by Years: {paste0(input$select_country)} - { input$vars_choice}'),
                                    tags$img(src = paste0("www/img/",input$vars_choice,".svg"))),
                                 data_chart()[1:4])

                           } else{
                             if (input$slider_new[1] == "1972") {
                               div(style = 'display: flex;     flex-wrap: wrap;     justify-content: center;',
                                   h2(class = 'split_chart_title',glue::glue('Continent by Years: {paste0(input$select_country)} - { input$vars_choice}'),
                                      tags$img(src = paste0("www/img/",input$vars_choice,".svg"))),
                                   data_chart()[1:5])

                             } else{
                               if (input$slider_new[1] == "1977") {
                                 div(style = 'display: flex;     flex-wrap: wrap;     justify-content: center;',
                                     h2(class = 'split_chart_title',glue::glue('Continent by Years: {paste0(input$select_country)} - { input$vars_choice}'),
                                        tags$img(src = paste0("www/img/",input$vars_choice,".svg"))),
                                     data_chart()[1:6])

                               } else{
                                 if (input$slider_new[1] == "1982") {
                                   div(style = 'display: flex;     flex-wrap: wrap;     justify-content: center;',
                                       h2(class = 'split_chart_title',glue::glue('Continent by Years: {paste0(input$select_country)} - { input$vars_choice}'),
                                          tags$img(src = paste0("www/img/",input$vars_choice,".svg"))),
                                       data_chart()[1:7])

                                 } else{
                                   if (input$slider_new[1] == "1987") {
                                     div(style = 'display: flex;     flex-wrap: wrap;     justify-content: center;',
                                         h2(class = 'split_chart_title',glue::glue('Continent by Years: {paste0(input$select_country)} - { input$vars_choice}'),
                                            tags$img(src = paste0("www/img/",input$vars_choice,".svg"))),
                                         data_chart()[1:8])

                                   } else{
                                     if (input$slider_new[1] == "1992") {
                                       div(style = 'display: flex;     flex-wrap: wrap;     justify-content: center;',
                                           h2(class = 'split_chart_title',glue::glue('Continent by Years: {paste0(input$select_country)} - { input$vars_choice}'),
                                              tags$img(src = paste0("www/img/",input$vars_choice,".svg"))),
                                           data_chart()[1:9])

                                     } else{
                                       if (input$slider_new[1] == "1997") {
                                         div(style = 'display: flex;     flex-wrap: wrap;     justify-content: center;',
                                             h2(class = 'split_chart_title',glue::glue('Continent by Years: {paste0(input$select_country)} - { input$vars_choice}'),
                                                tags$img(src = paste0("www/img/",input$vars_choice,".svg"))),
                                             data_chart()[1:10])

                                       } else{
                                         if (input$slider_new[1] == "2002") {
                                           div(style = 'display: flex;     flex-wrap: wrap;     justify-content: center;',
                                               h2(class = 'split_chart_title',glue::glue('Continent by Years: {paste0(input$select_country)} - { input$vars_choice}'),
                                                  tags$img(src = paste0("www/img/",input$vars_choice,".svg"))),
                                               data_chart()[1:11])

                                         } else{
                                           div(style = 'display: flex;     flex-wrap: wrap;     justify-content: center;',
                                               h2(class = 'split_chart_title',glue::glue('Continent by Years: {paste0(input$select_country)} - { input$vars_choice}'),
                                                  tags$img(src = paste0("www/img/",input$vars_choice,".svg"))),
                                               data_chart()[1:12])

                                         }
                                       }
                                     }
                                   }
                                 }
                               }
                             }
                           }
                         }
                       }
                     }
                   })

                 # renderUI({
                 #
                 # })



               })
}
