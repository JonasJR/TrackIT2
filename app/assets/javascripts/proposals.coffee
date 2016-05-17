ready = ->

  dropdown = $(".apply_project")

  dropdown.on  "click", (e) ->
    e.stopPropagation()
    alert "hej"

$(document).ready(ready)
$(document).on('page:load', ready)
