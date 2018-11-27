define [], () ->
  $.ajaxSetup # Global AJAX Event Handler
    beforeSend: (xhr) ->
      token = $('meta[name="csrf-token"]').attr('content');
      xhr.setRequestHeader 'X-CSRF-Token', token