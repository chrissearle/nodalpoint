$ ->
  $('#nodal_point_lens_id').change ->
    opt = $(this).find('option:selected')
    min = opt.data('min')
    max = opt.data('max')

    val = parseInt($('#nodal_point_focal_length').val(), 10)

    if val < min
      $('#nodal_point_focal_length').val(min)
    else if val > max
      $('#nodal_point_focal_length').val(max)
