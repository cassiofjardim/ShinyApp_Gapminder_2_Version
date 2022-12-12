library(shiny)

# cards_function <- function(x){
#
#
#   div(
#     id = 'panels_cards',
#     style  ='display: flex;justify-content: center; align-items: center; gap: 2em;',
#     div(id  = 'card1', style = 'height:100px; width: 150px; border:2px solid;'),
#
#     div( class="container", style="margin-top:50px;",
#       div( class="row",
#       div( class="col-md-3",
#       div( class="card-sl",
#       div( class="card-image",
#       tags$img(
#         src="https://images.pexels.com/photos/1149831/pexels-photo-1149831.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"
#       )
#       ),
#     div(class  ='text',
#       tags$a(class="card-action", href="#",
#              tags$i(class="fa fa-heart")
#              ),
#       div(class="card-heading",
#       'Audi Q8'),
#
#       div(class="card-text",
#       h6('Audi Q8 is a full-size luxury crossover SUV coupé made by Audi that was launched in 2018.')
#       ),
#       div(class="card-text",
#       '$67,400'
#       ),
#       tags$a(href="#" ,class="card-button",
#              'Purchase')
#       ))
#     )
#
# )
#   )
#   )
#
# }

cards_function_2 <- function(titulo,value,descritpion){
  div(
    id = 'panels_cards',
    style = 'font-family: Source Sans Pro,Helvetica,Arial,Lucida,sans-serif!important;
    display: flex; gap: 2em;justify-conter: center; align-items: center;
    height: fit-content;',
    div(
      id  = 'card1',
      style = 'height: fit-content;
    width: 250px;
      border:3px solid;background: #254948;
      color: whitesmoke;border-radius: 10px;
      font-family: Roboto Condensed, serif !important;',
      h3(
        titulo,
        style  = 'margin:0px;
          padding:.25em;
          border-bottom:5px double; font-size: 1.5em; font-family: Roboto Condensed, serif !important;'
      ),
      div(
        style  = 'display: flex;',


        div(
          class = 'right',
          style  = 'width: fit-content; height: 100%;margin: 0 auto;',
          h3(value, style = 'font-size:1.5em;margin: 0px;font-family: Roboto Condensed, serif !important;')
        )
      ),

      div(
        style  ='background:#254948;',
        h6(descritpion,
           style = 'margin:0px; color: whitesmoke !important;padding:.25em;
           font-size:1.05em;text-align: center; font-family: Roboto Condensed, serif !important;')
      ))






 )
}
