jQuery ->
  $('.disabled').on 'click', ->
    @.focus()
    false
