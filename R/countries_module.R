countries_UI <- function(id, countries_names,continent_countries_names, statistics_df, richest_country_continent) {
  ns <- NS(id)
  tagList(do.call(tabsetPanel,
                  # id = ns("FirstTabs"),
                  map(
                    1:length(countries_names),

                    ~ tabPanel(
                      title = h6(style = 'font-weight: 500;',paste0(sort(countries_names)[.x]),

                                 tags$img(src = paste0('www/img/icons_flags/',sort(countries_names)[.x],'.png'), width = '18px', height = '18px')),

                      id = 'panels_fluidrows',


                      div(class = 'card_div',

                          style  ='
                          /*display: grid;
                          grid-template-areas:"title title title title" "country life pop gdp";*/
                            background:whitesmoke;   border:4px double #254948;',

                          h3(id = 'card_tile_main',
                             style = 'grid-area: title;

                                  background: #254948;
                                  padding: 1em;

                                  color: whitesmoke !important;
                                  font-weight: 500;
                                  font-size: 1.25em;
                                  margin: 0;',
                             'Country growth rate for: Life Expectancy, Population and GDP per Capita. (Considering all sample: 1952 - 2007)'),
                          div(style = "display: flex;
                                      flex-wrap: wrap;
                                      justify-content: space-between;
                                      padding: 0 5em;",
                          cards_function_2(titulo = sort(countries_names)[.x],
                                           value = NULL,
                                           descritpion = tags$img(src = paste0('www/img/icons_flags/',sort(countries_names)[.x],'.png'),
                                                                  width = '78px', height = '78px')),

                          cards_function_2(titulo = 'Life Expectancy Growth (%)',
                                           value = paste0(statistics_df[[.x]][1],'%'),
                                           descritpion = ''),
                          cards_function_2(titulo = 'Population Growth (%)',
                                           value = paste0(statistics_df[[.x]][2],'%'),
                                           descritpion = ''),
                          cards_function_2(titulo = 'GDP Percapita Growth (%)',
                                           value = paste0(statistics_df[[.x]][3],'%'),
                                           descritpion = '')
                        )

                      ),

                      fluidRow(id  = 'countries_panels_rows_1',


                               column(
                                 width = 6,
                                 wellPanel(class='cinza',
                                   style = 'color: black;height:fit-content;',
                                   h1(
                                     style = 'color: black;',
                                     paste0(
                                       sort(unique(continent_countries_names))[.x],
                                       " Life Expectancy, Population Growth and GDP Percapita evolution"
                                     )
                                   ),
                                   tabsetPanel(
                                     id = ns(paste0('Left_Tab_', .x)),
                                     tabPanel(
                                       value = 1,
                                       title = tags$img("Life Expectancy",src = 'www/img/exp_life.svg',   width = '26px', height = '26px'),
                                       wellPanel(
                                       highcharter::highchartOutput(outputId = ns(paste0(
                                         'life_chart_', sort(countries_names)[.x]
                                       )), height = 250),

                                       div(
                                         class = "date_slider",

                                         shinyWidgets::sliderTextInput(
                                           width = '100%',
                                           inputId =  ns("slider_years_life"),
                                           label = "Years Range",

                                           choices = c(as.character(seq(1952, 2007, 5))),
                                           selected = '2007'
                                           # '2007-2021'
                                         )
                                       )),
                                       p("In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate.",
                                         tags$img(src = 'img/united_nations.svg'),
                                         style = 'display: flex; justify-content: space-between;')
                                     ),
                                     tabPanel(
                                       title = tags$img("Population",src = 'www/img/population.svg',    width = '26px', height = '26px'),
                                       value = 2,
                                       wellPanel(
                                       highcharter::highchartOutput(outputId = ns(paste0(
                                         'pop_chart_', sort(countries_names)[.x]
                                       )), height = 250),

                                       div(
                                         class = "date_slider",

                                         shinyWidgets::sliderTextInput(
                                           width = '100%',
                                           inputId =  ns("slider_years_pop"),
                                           label = "Years Range",

                                           choices = c(as.character(seq(1952, 2007, 5))),
                                           selected = '2007'
                                           # '2007-2021'
                                         )
                                       )

                                     ),

                                     p("In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate.",
                                       tags$img(src = 'img/united_nations.svg'),
                                       style = 'display: flex; justify-content: space-between;')),
                                     tabPanel(
                                       title = tags$img("GDP Percapita",src = 'www/img/gdp.svg',  width = '26px', height = '26px'),
                                       value = 3,
                                       wellPanel(
                                       highcharter::highchartOutput(outputId = ns(paste0(
                                         'gdp_chart_', sort(countries_names)[.x]
                                       )), height = 250),

                                       div(
                                         class = "date_slider",

                                         shinyWidgets::sliderTextInput(
                                           width = '100%',
                                           inputId =  ns("slider_years_gdp"),
                                           label = "Years Range",

                                           choices = c(as.character(seq(1952, 2007, 5))),
                                           selected = '2007'
                                           # '2007-2021'
                                         )
                                       )),


                                       p("In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate.",
                                         tags$img(src = 'www/img/united_nations.svg'),
                                         style = 'display: flex; justify-content: space-between;')

                                     )
                                   )


                                 )
                               ),



                               column(
                                 width = 6,
                                 wellPanel(
                                   class='cinza',
                                   style = 'color: black;height:fit-content;',
                                   h1(
                                     style = 'color: black;',
                                     paste0(
                                       sort(unique(continent_countries_names))[.x],
                                       " x ",richest_country_continent, "(Continent Richest Country)"
                                     )
                                   ),

                                   tabsetPanel(
                                     id = ns(paste0('Right_Tab_', .x)),
                                     tabPanel(

                                       title = tags$img( "Life Expectancy - (Continent)",src = 'www/img/exp_life.svg',   width = '26px', height = '26px'),
                                       value  = 1,
                                       wellPanel(
                                         # h1(paste0(
                                         #   "Comparision: ", sort(sort(countries_names))[.x], " x Continent"
                                         # ),
                                         # style = 'color: black;'),

                                         highcharter::highchartOutput(outputId = ns(
                                           paste0('difference_life_chart_', sort(countries_names)[.x])
                                         ), height = 250)
                                       ),

                                       p("In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate.")
                                     ),

                                     tabPanel(


                                       title = tags$img("Population - (Continent)",src = 'www/img/population.svg',   width = '26px', height = '26px'),

                                       value = 2,
                                       wellPanel(

                                       highcharter::highchartOutput(outputId = ns(paste0(
                                         'difference_pop_chart_', sort(countries_names)[.x]
                                       )), height = 250)
                                     ),

                                     p("In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate.")

                                     ),

                                     tabPanel(

                                       title = tags$img( "GDP Percapita - (Continent)",
                                                         src = 'www/img/gdp.svg',   width = '26px', height = '26px'),
                                       value = 3,
                                       wellPanel(
                                       highcharter::highchartOutput(outputId = ns(paste0(
                                         'difference_gdp_chart_', sort(countries_names)[.x]
                                       )), height = 250)
                                     ),

                                     p("In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate."))



                                   )
                                 )
                               )
                              ),

                      fluidRow(id  = 'countries_panels_rows_2',
                               column(
                                 width = 6,
                                 wellPanel(class = 'cinza',
                                   style = '',
                                   h1(
                                     style = 'color: black;',
                                     paste0(
                                       "Comparision: ",
                                       sort(unique(continent_countries_names))[.x],
                                       " x United States (Richest Country in the World)"
                                     )
                                   ),

                                   tabsetPanel(
                                     id = 'country_usa_panels',
                                     tabPanel(
                                              title = tags$img( "Life Expectancy - (United States)",
                                                                src = 'www/img/exp_life.svg',   width = '26px', height = '26px'),
                                              wellPanel(
                                                highcharter::highchartOutput(outputId = ns(paste0(
                                                  'country_us_chart_life', sort(countries_names)[.x]
                                                )), height = 250)
                                              )),

                                     tabPanel(title = tags$img( "Population - (United States)",
                                                                src = 'www/img/population.svg',   width = '26px', height = '26px'),

                                              wellPanel(
                                              highcharter::highchartOutput(
                                                outputId = ns(paste0(
                                                  'country_us_chart_pop', sort(countries_names)[.x]
                                                )), height = 250
                                              ))),

                                     tabPanel(
                                              title = tags$img("GDP Percapita - (United States)",
                                                               src = 'www/img/gdp.svg',   width = '26px', height = '26px'),


                                              wellPanel(
                                              highcharter::highchartOutput(
                                                outputId = ns(paste0(
                                                  'country_us_chart_gdp', sort(countries_names)[.x]
                                                )), height = 250
                                              )))

                                   )


                                 )
                               ),

                               column(
                                 width = 6,
                                 wellPanel(class = 'cinza',
                                   style = 'color: black;',
                                   h1('Dataset - Country', style  = 'color: black;'),

                                   downloadButton(
                                     ns(glue::glue("download_country{.x}")),
                                     class = 'download_table_btn',
                                     icon = NULL,
                                     label = 'Download(.xlsx)'
                                   ),
                                   reactable::reactableOutput(ns(paste0(
                                     'tabel_country_', .x
                                   )), height = 'auto')

                                 )
                               ))





                    )



                  )))
}

countries_Server <- function(id, countries_selected_df,continent_richeste_country, countries_names) {
  moduleServer(id,
               function(input, output, session) {

                 observe_tabpanels_function <- function(x){

                   observeEvent(input[[paste0('Left_Tab_',x)]] , {
                     updateTabsetPanel(session, paste0('Right_Tab_',x),
                                       selected = input[[paste0('Left_Tab_',x)]])
                   })

                 }

                 1:length(sort(countries_names)) %>% map(~ observe_tabpanels_function(.x))

################################################################################
######################### TOP LEFT CHART #######################################
################################################################################

                 charts_output_life <- function(x) {
                   output[[paste0("life_chart_", sort(countries_names)[x])]] <-
                     highcharter::renderHighchart({
                       countries_selected_df[[x]] %>%
                         filter(year <= .env$input$slider_years_life[1])%>%
                         countries_charts(var = 'lifeExp')

                     })

                   output[[paste0("pop_chart_", sort(countries_names)[x])]] <-
                     highcharter::renderHighchart({
                       countries_selected_df[[x]] %>%
                         filter(year <= input$slider_years_pop[1])%>%
                         countries_charts(var = 'pop')

                     })

                   output[[paste0("gdp_chart_", sort(countries_names)[x])]] <-
                     highcharter::renderHighchart({
                       countries_selected_df[[x]] %>%
                         filter(year <= input$slider_years_gdp[1])%>%
                         countries_charts(var = 'gdpPercap')

                     })


                 }

                 1:length(sort(countries_names)) %>% map(~ charts_output_life(.x))

#*******************************************************************************
#*****************Countries Comparision CHARTS: TOP RIGHT **********************
#*******************************************************************************
                 charts_difference <- function(x) {
                   output[[paste0("difference_life_chart_", sort(countries_names)[x])]] <-
                     highcharter::renderHighchart({
                       countries_x_egypt_function(
                         data = countries_selected_df[[x]],
                         var = 'lifeExp',
                         var_rich = 'richest_LifeExp',
                         var_diff = 'diff_lifeExp',
                         richest_country_name = continent_richeste_country,
                         country_name = sort(countries_names)[x]
                       )

                     })

                   output[[paste0("difference_pop_chart_", sort(countries_names)[x])]] <-
                     highcharter::renderHighchart({
                       countries_x_egypt_function(
                         data = countries_selected_df[[x]],
                         var = 'pop',
                         var_rich = 'richest_pop',
                         var_diff = 'diff_pop',
                         richest_country_name = continent_richeste_country,
                         country_name = sort(countries_names)[x]
                       )

                     })

                   output[[paste0("difference_gdp_chart_", sort(countries_names)[x])]] <-
                     highcharter::renderHighchart({
                       countries_x_egypt_function(
                         data = countries_selected_df[[x]],
                         var = 'gdpPercap',
                         var_rich = 'richest_gdp',
                         var_diff = 'diff_gdp',
                         richest_country_name = continent_richeste_country,
                         country_name = sort(countries_names)[x]
                       )

                     })


                 }

                 1:length(sort(countries_names)) %>% map(~ charts_difference(.x))

##******************************************************************************
##*****************Countries TABLE DOWNLOAD*************************************
##******************************************************************************
                 tables_output_function <- function(x) {
                   output[[paste0("tabel_country_", x)]] <-
                     reactable::renderReactable({
                       countries_selected_df[[x]] %>%
                         select(country,-continent,  year, lifeExp, pop, gdpPercap) %>%

                         table_style(height = 'auto',
                                     fontsize = '12px',
                                     cellPadding = '3px 6px')
                     })

                 }


                 1:length(sort(countries_names)) %>% map( ~ tables_output_function(.x))

                 tables_download_function <- function(x) {
                   output[[paste0('download_country', x)]] <- downloadHandler(
                     filename = function() {
                       paste0(sort(countries_names)[x], ".xlsx")
                     },
                     content = function(file) {
                       writexl::write_xlsx(
                         countries_selected_df[[x]] %>%
                           select(country,-continent,  year, lifeExp, pop, gdpPercap),
                         file
                       )
                     }
                   )

                 }

                 1:length(sort(countries_names)) %>% map( ~ tables_download_function(.x))
##******************************************************************************
##*****************Countries CHARTS UNITED STATES X COUNTRY*********************
##******************************************************************************
##*
##*
                 charts_us_comparision <- function(x) {

                   output[[paste0("country_us_chart_life", sort(countries_names)[x])]] <-

                     highcharter::renderHighchart({
                       function_us_chart(
                         data = countries_selected_df[[x]],
                         var = 'lifeExp', var_us = 'lifeExp_us',
                         country_name = sort(countries_names)[x]
                       )

                     })

                   output[[paste0("country_us_chart_pop", sort(countries_names)[x])]] <-
                     highcharter::renderHighchart({
                       function_us_chart(
                         data = countries_selected_df[[x]],
                         var = 'pop', var_us = 'pop_us',
                         country_name = sort(countries_names)[x]
                       )

                     })

                   output[[paste0("country_us_chart_gdp", sort(countries_names)[x])]] <-
                     highcharter::renderHighchart({
                       function_us_chart(
                         data = countries_selected_df[[x]],
                         var = 'gdpPercap', var_us = 'gdp_us',
                         country_name = sort(countries_names)[x]
                       )

                     })




                 }

                 1:length(sort(countries_names)) %>% map( ~ charts_us_comparision(.x))


               })





}
