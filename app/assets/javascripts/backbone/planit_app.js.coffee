require [
    'hbs/handlebars', 'helpers/view_extensions', 'helpers/model_extensions',
    'apphelpers/ajax', 'apphelpers/handlebars', 'routers/profile_router',
    'bootstrap'],
  (Handlebars, BackboneViewExt, BackboneModelExt, AjaxHelper, HandlebarsHelper, ProfilesRouter,
   bootstrap) ->
    PlanitApp =
      initialize: ->
        new ProfilesRouter
        Backbone.history.start()

    PlanitApp.initialize()