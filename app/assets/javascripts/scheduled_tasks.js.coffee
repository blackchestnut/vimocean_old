$(document).on 'page:change', ->
  $('.task').on 'click', (e) ->
    $(@).toggleClass('active')
