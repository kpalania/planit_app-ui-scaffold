define ['collections/profile_collection', 'views/profiles/profiles_edit', 'views/profiles/profiles_new',
        'models/profile'], (ProfilesCollection, ProfilesEdit, ProfilesNew, Profile) ->
  class ProfilesRouter extends Backbone.Router

    routes:
      '': '#'
      'profiles/new': 'new'
      'profiles/:id/edit': 'edit'

    new: ->
      view = new ProfilesNew collection: new ProfilesCollection
      $("#content").html(view.render().el)

    edit: (id) ->
      model = new Profile
      model.id = id
      model.fetch
        success: (data) ->
          view = new ProfilesEdit model: data
          $('#content').html(view.render().el)
