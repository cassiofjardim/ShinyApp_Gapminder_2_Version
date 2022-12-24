


countries_charts <- function(data, var) {
  data %>%


    highcharter::hchart(
      "areaspline",

      highcharter::hcaes(x = year, y = .data[[var]]),
      visible = TRUE,
      showInLegend = TRUE,
      name  = paste0(var),
      zIndex = 9999999,
      zoneAxis = 'x',
      color = 'black'
    ) %>%


    highcharter::hc_xAxis(
      title = list(
        text = "Years",
        style = list(fontWeight = "bold",
                     color = "black")
      ),

      plotLines = list(
        list(
          width = 2,
          color = "black",
          dashStyle = "longdashdot",

          label = list(
            text = "",
            align = "right",
            verticalAlign = "middle",
            rotation = 0,
            x = 180,
            y = 100,
            style = list(color = "black", fontWeight = "bold")
          )
        )
      ),

      plotBands = list(list(
        label = list(
          dashStyle = "longdashdot",

          text = "",
          style = list(
            fontWeight = "bold",
            color = "black",
            fontSize = "12px"
          )
        )
      ))


    ) %>%

    highcharter::hc_yAxis(
      title = list(
        text = paste0(var),

        style = list(fontWeight = "bold",
                     color = "black")
      ),

      style = list(
        fontSize = "16px",
        color =  "black",
        fontWeight = "900",
        fontFamily = "Roboto Condensed"
      ),

      plotLines = list(list(
        color = "black",
        dashStyle = "longdashdot",

        label = list(
          text = "Forecasting",
          align = "right",
          verticalAlign = "middle",
          rotation = 0,
          x = 180,
          y = 50,
          style = list(color = "black", fontWeight = "bold")
        )
      )),
      gridLineWidth = 0.5,
      gridLineColor = 'black',
      gridLineDashStyle = "longdash"
    ) %>%

    highcharter::hc_tooltip(
      outside = TRUE,
      shadow = TRUE,
      borderColor = "lightgray",
      botderWidth = 0,
      backgroundColor = "whitesmoke",
      style = list(textOutline = "5px white")
    ) %>%

    highcharter::hc_plotOptions(
      series = list(
        marker = list(enabled = TRUE,
                      radius =  2.5),
        lineWidth = .25,
        shadow = TRUE,
        fillOpacity = 0.025,
        color = "lightblue",
        fillColor = list(
          linearGradient = list(
            x1 = 0,
            y1 = 0,
            x2 = 1,
            y2 = 1
          ),
          stops = list(list(0.10, "#BBDBBE"), list(.5, "#DEEBDD"))
        )
      )

    )

}







table_style <-
  function(dataframe,
           height = NULL,
           fontsize = NULL,
           cellPadding = NULL) {
    dataframe %>%
      reactable::reactable(
        style = list(fontFamily = glue::glue("{}")),
        pagination = FALSE,
        height = height,


        striped = TRUE,
        highlight = TRUE,
        bordered = TRUE,
        theme = reactable::reactableTheme(
          borderColor = "lightgray",
          borderWidth = 1.5,
          stripedColor = "#f6f8fa",
          highlightColor = "#f0f5f9",
          cellPadding = cellPadding,
          style = list(fontFamily = glue::glue("{}")),
          searchInputStyle = list(width = "100%")
        ),
        defaultColDef = reactable::colDef(
          vAlign = "center",
          headerVAlign = "bottom",
          align = 'center',
          style  = list(fontWeight = "bold"),

          footerStyle = list(fontWeight = "bold")
        ),
        columns = list(
          country = reactable::colDef(
            name = "Country",
            style = list(
              fontSize = fontsize,
              fontWeight = "bold",
              background = "rgba(0, 0, 0, 0.05)"
            ),

            sticky = "left"

          ),

          continent = reactable::colDef(
            name = "Continent",
            style = list(
              fontSize = fontsize,
              fontWeight = "bold",
              background = "rgba(0, 0, 0, 0.05)"
            )
          ),
          lifeExp = reactable::colDef(
            name = "Life Expectancy",
            style = list(
              fontSize = fontsize,
              fontWeight = "bold",
              background = "rgba(0, 0, 0, 0.05)"
            )
          ),
          pop = reactable::colDef(
            name = "Population",
            style = list(
              fontSize = fontsize,
              fontWeight = "bold",
              background = "rgba(0, 0, 0, 0.05)"
            )
          ),
          gdpPercap = reactable::colDef(
            name = "GDP Percap.",
            style = list(
              fontSize = fontsize,
              fontWeight = "bold",
              background = "rgba(0, 0, 0, 0.05)"
            )
          ),

          year = reactable::colDef(
            name = "Years",

            width = 100,

            format = reactable::colFormat(separators = FALSE),
            style = list(
              fontSize = fontsize,
              fontWeight = "bold",
              background = "whitesmoke"
            )


          )

        )
      )
  }











countries_x_egypt_function <-
  function(data,
           var,
           var_rich,
           var_diff,
           country_name,
           richest_country_name)  {
    highcharter::highchart(type = 'chart') %>%

      ############### Adicionar Serie Trucks ##########################################

    highcharter::hc_add_series(
      data =  data,
      "line",

      highcharter::hcaes(x = year, y = .data[[var]]),
      lineWidth = 2,

      color = '#254948',
      name = country_name
    ) %>%

      highcharter::hc_add_series(
        data = data ,
        "line",

        highcharter::hcaes(x = year, y = .data[[var_rich]]),
        lineWidth = 2,
        color = 'blue',

        name = richest_country_name
      ) %>%

      highcharter::hc_add_yAxis(
        title = list(
          text = paste0(country_name, " x ", richest_country_name, ": ", var),
          rotation = 0,

          offset = 75
        ),
        style = list(fontWeight = "bold"),
        opposite = FALSE,
        relative = 3,

        gridLineWidth = 0.5,
        gridLineColor = 'black',
        gridLineDashStyle = "longdash",

        labels = list(
          style = list(
            color =  'black',
            fontWeight = "bold",
            fontFamily = "Roboto Condensed"
          )
        ),
        lineWidth = 0
      ) %>%

      # #############################################################################
    # # Abrir Espaço para Serie de Erros e Adicionar Serie de Erros
    # #############################################################################
    highcharter::hc_add_yAxis(
      title = list(
        text = "Difference in Time:",
        style = list(fontWeight = "bold",
                     color = "black"),
        rotation = 0,

        offset = 75
      ),

      relative = 1,
      opposite = FALSE,
      gridLineWidth = 0.5,
      gridLineColor = '#73BB91',
      gridLineDashStyle = "longdash",
      #
      labels = list(
        style = list(
          color =  'black',
          fontWeight = "bold",
          fontFamily = "Roboto Condensed"
        )
      )
    ) %>%

      highcharter::hc_add_series(
        data = data,
        "column",
        highcharter::hcaes(x = year, y = .data[[var_diff]]),
        yAxis = 1,
        showInLegend = T,
        name = "Difference In Time",
        color = "#82b2b0"
      ) %>%

      highcharter::hc_chart(zoomType = "x") %>%

      highcharter::hc_exporting (
        enabled = TRUE,
        filename = "chart_data",
        style = list(
          fontSize = "14px",
          color =  "black",
          fontWeight = "700",
          fontFamily = "Roboto Condensed"
        ),
        buttons = list(contextButton = list(
          menuItems = list('downloadSVG', 'downloadXLS',
                           'separator', 'label')
        ))
      ) %>%
      highcharter::hc_plotOptions(series = list(
        lineWidth = 3,
        marker = list(enabled = TRUE),
        borderRadius = 1

      ))

  }

################################################################################
############### BAR CHART ######################################################
################################################################################

function_us_chart <- function(data, var, var_us, country_name) {
  highcharter::highchart(type = 'chart') %>%

    highcharter::hc_add_series(
      data =  data,
      "column",

      highcharter::hcaes(x = year, y = .data[[var]]),
      lineWidth = 2,
      # showInLegend = TRUE,
      color = '#254948',
      name = country_name
    ) %>%

    highcharter::hc_add_series(
      data = us_df ,
      "column",
      color = 'red',

      highcharter::hcaes(x = year, y = .data[[var_us]]),
      lineWidth = 2,
      # showInLegend = TRUE,
      name = "United States"
    )

}




################################################################################
############################# GENERAL OVERVIEW #################################
################################################################################

general_overview_charts <- function(data, var, year) {
  highcharter::highchart(type = 'chart') %>%
    highcharter::hc_add_series(
      data = data,
      showInLegend = FALSE,
      highcharter::hcaes(x = year, y = .data[[var]], group = country),
      type = 'column'
    ) %>%
    highcharter::hc_title(
      text = paste0(unique(data$year)),
      margin = 20,
      align = "center",
      style = list(
        color = "black",
        fontWeight = 'bold',
        useHTML = TRUE
      )
    ) %>%
    highcharter::hc_size(height = 200, width = 250) %>% highcharter::hc_boost(enabled = FALSE)
}
