$(document).ready ->

  student = $(".student")
  company = $(".company")

  student.on "click", (e) ->
    check_signed_in(e)

  company.on "click", (e) ->
    check_signed_in(e)


check_signed_in = (e) ->
  body = $("body")
  unless body.data("signed-in") == true
    e.preventDefault()
    console.log "signed out"
    $("#loginModal").modal("show")
