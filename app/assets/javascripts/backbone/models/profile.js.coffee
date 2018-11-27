define ['jquery', 'backbone'], ($, Backbone) ->
  class Profile extends Backbone.Model
    paramRoot: 'profile'
    idAttribute: 'id'

    listener = ->
      console.log "..profile attribute modified"

    initialize: ->
      @bind "change:user_name", listener
      @bind "change:first_name", listener
      @bind "change:middle_name", listener
      @bind "change:last_name", listener

    methodUrl: (method) ->
      if method is "update" or method is "read"
        return 'profiles/' + @.id
      else if method is "create"
        return 'profiles'
      else
        return false