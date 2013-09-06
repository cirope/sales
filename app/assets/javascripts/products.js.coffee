$(document).on 'change', 'select[data-go-to-url]', ->
  Turbolinks.visit $(this).val()
