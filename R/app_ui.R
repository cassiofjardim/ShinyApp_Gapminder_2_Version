#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic



    bs4Dash::dashboardPage(


        dark = FALSE,
        # fullscreen = TRUE,



        bs4Dash::dashboardHeader(title = "Gapminder Dashboard",

                        tags$li(
                          class = 'dropdown',
                          tags$img(src = 'https://www.gapminder.org/wp-content/themes/gapminder2/images/gapminder-logo.svg',
                                   class = 'gapminder_logo')
                        )),

        bs4Dash::dashboardSidebar(
          collapsed = FALSE,

          bs4Dash::sidebarMenu(
            id = "sidebarMenu",
            bs4Dash::menuItem(
              text = p(
                tags$img(
                  src = paste0('www/img/icons_flags/', 'Africa', '.png'),
                  width = '18px',
                  height = '18px',
                  style = 'margin-right: .25em;'
                ),
                "Africa",
                style = '    text-decoration: none;font-style: normal;
                                              font-size: 1em; margin-left: 1em;font-weight: 600;'
              ),
              tabName = "panel_2"
            ),
            bs4Dash::menuItem(
              text = p(
                tags$img(
                  src = paste0('www/img/icons_flags/', 'Americas', '.png'),
                  width = '18px',
                  height = '18px',
                  style = 'margin-right: .25em;'
                ),
                "Americas",
                style = '    text-decoration: none;font-style: normal;
                                              font-size: 1em; margin-left: 1em;font-weight: 600;'
              ),
              tabName = "panel_3"
            ),
            bs4Dash::menuItem(
              text = p(
                tags$img(
                  src = paste0('www/img/icons_flags/', 'Asia', '.png'),
                  width = '18px',
                  height = '18px',
                  style = 'margin-right: .25em;'
                ),
                "Asia",
                style = '    text-decoration: none;font-style: normal;
                                              font-size: 1em; margin-left: 1em;font-weight: 600;'
              ),
              tabName = "panel_4"
            ),
            bs4Dash::menuItem(
              text = p(
                tags$img(
                  src = paste0('www/img/icons_flags/', 'Europe', '.png'),
                  width = '18px',
                  height = '18px',
                  style = 'margin-right: .25em;'
                ),
                "Europe",
                style = '    text-decoration: none;font-style: normal;
                                              font-size: 1em; margin-left: 1em;font-weight: 600;'
              ),
              tabName = "panel_5"
            ),
            bs4Dash::menuItem(
              text = p(
                tags$img(
                  src = paste0('www/img/icons_flags/', 'Oceania', '.png'),
                  width = '18px',
                  height = '18px',
                  style = 'margin-right: .25em;border-radius: 50%;'
                ),
                "Oceania",
                style = '    text-decoration: none;font-style: normal;
                                              font-size: 1em; margin-left: 1em;font-weight: 600;'
              ),
              tabName = "panel_6"
            ),

            bs4Dash::menuItem(
              text =  p(
                "General Overview - by Years",
                style = '    text-decoration: none;font-style: normal;
                                              font-size: .95em; margin-left: .25em;font-weight: 600;'
              ),
              tabName = "panel_1"
            )
          )


        ),


        bs4Dash::dashboardBody(
          # tags$head(
          #   tags$link(rel = "stylesheet", type = "text/css", href = "inst/app/www/style.css")
          # ),

          includeCSS(path = 'inst/app/www/style.css'),
          # includeCSS(path = 'inst/app/www/card.css'),




          bs4Dash::tabItems(
            bs4Dash::tabItem(
              tabName = "panel_2",
              countries_UI(
                "africa",
                countries_names = names_africa,
                richest_country_continent = 'Egypt',
                continent_countries_names = dash_df$Africa$country,
                statistics_df = statistics_africa
              )
            ),
            bs4Dash::tabItem(
              tabName = "panel_3",
              countries_UI(
                "americas",
                countries_names = names_americas,
                richest_country_continent = 'United States',
                continent_countries_names = dash_df$Americas$country,
                statistics_df = statistics_americas
              )
            ),
            bs4Dash::tabItem(
              tabName = "panel_4",
              countries_UI(
                "asia",
                countries_names = names_asia,
                richest_country_continent = 'Japan',
                continent_countries_names = dash_df$Asia$country,
                statistics_df = statistics_asia
              )
            ),
            bs4Dash::tabItem(
              tabName = "panel_5",
              countries_UI(
                "europe",
                countries_names = names_europe,
                richest_country_continent = 'United Kingdon',
                continent_countries_names = dash_df$Europe$country,
                statistics_df = statistics_europe
              )
            ),
            bs4Dash::tabItem(
              tabName = "panel_6",
              countries_UI(
                "oceania",
                countries_names = names_oceania,
                richest_country_continent = 'Australia',
                continent_countries_names = dash_df$Oceania$country,
                statistics_df = statistics_oceania
              )
            ),

            bs4Dash::tabItem(tabName = "panel_1",
                    general_overview_UI("tela1"))
          )
        )

      )



  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")

  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "Gapminder"
    )


    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
