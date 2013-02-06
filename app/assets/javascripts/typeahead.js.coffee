$ ->
  $('.brand-typeahead').typeahead(
    minLength: 2,
    source: (query, typeahead) ->
      $.ajax(
        url: $('.brand-typeahead').data('typeahead-link') + "?prefix=" + query
        success: (data) =>
          typeahead(data)
      )
  )