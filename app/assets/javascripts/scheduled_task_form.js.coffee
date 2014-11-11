change_time = (input, add_minutes) ->
  date_on = $('#task_started_on').val()
  date = Date.parse(date_on + ' ' + input.val())
  date = new Date(date + add_minutes * 60000)
  hh_mm = date.toTimeString().match(/\d{2}:\d{2}/)
  input.val(hh_mm[0])

$(document).on 'page:change', ->
  $page = $('.tasks.new, .tasks.edit')
  $('a.from_sub').on 'click', ->
    change_time($('#task_started_at'), -10)
  $('a.from_add').on 'click', ->
    change_time $('#task_started_at'), +10
  $('a.to_sub').on 'click', ->
    change_time($('#task_finished_at'), -10)
  $('a.to_add').on 'click', ->
    change_time($('#task_finished_at'), +10)
