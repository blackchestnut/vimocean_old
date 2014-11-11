$(document).on 'page:change', ->
  $('.task').on 'click', ->
    $(@).toggleClass('active')

  $('.task').on 'dblclick', ->
    window.location = $(@).data('edit-url')

