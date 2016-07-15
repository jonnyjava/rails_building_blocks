$ ->

  storage = $.localStorage

  # Date
  $('.datepicker').datetimepicker({
    format: 'DD/MM/YYYY'
  })

  # on render page
  $('[data-toggable-search]').each ->
    target = $(this).data('toggable-search')
    key = "togglable_forms.#{target}"
    $("##{target}").toggle(storage.isSet(key))

  $(document).on 'click', '[data-toggable-search]', (e) ->
    target = $(this).data('toggable-search')
    key = "togglable_forms.#{target}"
    if storage.isSet(key)
      storage.remove(key)
    else
      storage.set(key, 'true')
    $("##{target}").toggle(storage.isSet(key))