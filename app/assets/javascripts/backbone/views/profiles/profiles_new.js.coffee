define ['hbs!templates/profiles/new'], (TemplateNew) ->
  class ProfilesNew extends Backbone.View

    template: TemplateNew

    events:
      "submit #new-profile": "save"
      "change input": "changed"
      "change select": "changed"

    initialize: ->
      _.bindAll this, "changed"

    changed: (evt) ->
      @.change_event(evt)

    constructor: (options) ->
      super(options)
      @model = new @collection.model()

      @model.bind("change:errors", () =>
        @.render()
      )

    render: ->
      @$el.html(@template(@model.toJSON()))
      @

    save: (e) ->
      e.preventDefault()
      e.stopPropagation()

      @model.unset("errors")

      @collection.create @model.toJSON(),
        success: (profile) =>
          @model = profile
          Backbone.history.navigate ''
          window.location.reload()

        error: (profile, jqXHR) =>
          console.log jqXHR.responseText
          profile.set errors: $.parseJSON(jqXHR.responseText)