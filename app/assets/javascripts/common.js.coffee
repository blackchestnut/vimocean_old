$(document).on 'page:change', ->
  $('.disabled').on 'click', ->
    @.focus()
    false
