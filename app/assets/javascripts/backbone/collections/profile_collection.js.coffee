define ['models/profile'], (Profile) ->
  class ProfilesCollection extends Backbone.Collection
    url: '/profiles'
    model: Profile

    parse: (response, xhr) ->
      response.profiles