class HomeView extends Backbone.View
  template: require './home.jade'
  region: '#content-region'

  initialize: ->
    @message = ko.observable()
    @model = api.get 'messageModel'
    @model.fetch().then (res) =>
      @message res.message

module.exports = HomeView
