
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
