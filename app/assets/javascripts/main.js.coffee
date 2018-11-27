requirejs.config
  baseUrl: '/assets'

  paths:
# NOTE: application/lib/hbs/i18nprecompile & application/lib/hbs/json2 are NOT included in this list, yet.
    backbone: 'application/lib/backbone'
    underscore: 'application/lib/underscore'
    text: 'application/lib/text'
    hbs: 'application/lib/hbs'
    jquery: 'application/lib/jquery'
    routers: 'backbone/routers'
    views: 'backbone/views'
    models: 'backbone/models'
    collections: 'backbone/collections'
    templates: 'backbone/templates'
    helpers: 'backbone/helpers'
    apphelpers: 'application/helpers'
    planitapp: 'backbone/planit_app'

  shim:
    jquery:
      exports: '$'
    underscore:
      deps: ['jquery']
      exports: '_'
    backbone:
      deps: ['underscore', 'jquery']
      exports: 'Backbone'

# Start the main app logic.

requirejs ['jquery', 'application'], ($, application) ->
  console.log '..Require.js Initialized'
