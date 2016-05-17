ready = ->

  apply_button = $("#apply_project")
  apply_form = $("#apply_form")

  apply_button.on "click", (e) ->
    apply_form.show
    alert "hej"

$(document).ready(ready)
$(document).on('page:load', ready)
