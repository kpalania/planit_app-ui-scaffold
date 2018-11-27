require ['backbone', 'underscore'], (Backbone, _) ->
  _.extend(Backbone.View.prototype, {

    change_event: (evt) -> # Bind the attributes
      changed = evt.currentTarget
      value = $(evt.currentTarget).val()
      attrs = {}
      attrs[changed.name] = value
      @model.set attrs

  })