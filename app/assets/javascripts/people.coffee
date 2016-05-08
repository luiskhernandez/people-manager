readURL = (input) ->
  if input.files and input.files[0]
    reader = new FileReader

    reader.onload = (e) ->
      $('.image_to_upload').attr 'src', e.target.result
      return

    reader.readAsDataURL input.files[0]
  return

$ ->
  $('#person_picture').change ->
    readURL this
    return
  return
