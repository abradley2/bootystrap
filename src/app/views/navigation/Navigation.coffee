class NavigationView extends Backbone.View
  template: require './navigation.jade'
  region: '#navigation-region'

  initialize: ->
    @isLoggedIn = ko.observable false

module.exports = NavigationView
