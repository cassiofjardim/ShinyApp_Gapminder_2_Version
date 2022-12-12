#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic

  countries_Server(
    "africa",
    countries_selected_df = countries_selected_africa,
    countries_names = names_africa,
    continent_richeste_country = 'Egypt'
  )

  countries_Server(
    "americas",
    countries_selected_df = countries_selected_americas,
    countries_names = names_americas,
    continent_richeste_country = 'United States'
  )

  countries_Server(
    "asia",
    countries_selected_df = countries_selected_asia,
    countries_names = names_asia,
    continent_richeste_country = 'Japan'
  )

  countries_Server(
    "europe",
    countries_selected_df = countries_selected_europe,
    countries_names = names_europe,
    continent_richeste_country = 'United Kingdon'
  )

  countries_Server(
    "oceania",
    countries_selected_df = countries_selected_oceania,
    countries_names = names_oceania,
    continent_richeste_country = 'Australia'
  )


  general_overview_Server("tela1")





}
