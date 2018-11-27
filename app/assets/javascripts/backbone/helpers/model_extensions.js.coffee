require ['backbone', 'underscore'], (Backbone, _) ->
  _.extend(Backbone.Model.prototype, {

    sync: (method, model, options) ->
      if model.methodUrl and model.methodUrl(method.toLowerCase())
        options = options or {}
        options.url = model.methodUrl(method.toLowerCase())

      formData = new FormData()

      # Loop over model attributes and append to formData
      _.each model.attributes, (value, key) ->
        # console.log 'key: ' + key + ',value: ' + value
        key = model.paramRoot + '[' + key + ']'
        if value == null
          value = ''

        formData.append key, value

      # Set processData and contentType to false so data is sent as FormData
      _.defaults options or (options = {}),
        data: formData
        processData: false
        contentType: false

      Backbone.sync method, model, options
  })