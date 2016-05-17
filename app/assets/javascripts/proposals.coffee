ready = ->

  apply_button = $("#apply_project")
  apply_form = $("#apply_form")
  hidden = true

  show_form = () ->
    do $("#apply_form").show
    hidden = false

  hide_form = () ->
    do $("#apply_form").hide
    hidden = true

  hide_form()
  
  apply_button.on "click", (e) ->
    if(hidden)
      show_form()
    else
      hide_form()
    false

$(document).ready(ready)
$(document).on('page:load', ready)
