define ['hbs!templates/profiles/edit'], (TemplateEdit) ->
  class ProfilesEdit extends Backbone.View

    template: TemplateEdit

    events:
      "submit #edit-profile": "update"
      "change input": "changed"
      "change select": "changed"

    initialize: ->
      _.bindAll this, "changed"

    changed: (evt) ->
      @.change_event(evt)

    render: ->
      @$el.html(@template(profile: @model.toJSON()))
      @

    update: (e) ->
      e.preventDefault()
      e.stopPropagation()

      @model.save(null,
        success: (profile) =>
          window.location.hash = "#"
          window.location.reload()
      )
