class HomeView extends Backbone.View
  template: require './home.jade'

  initialize: ->
    @message = ko.observable()
    @model = api.get 'message'
    @getMessage()

  getMessage: ->
    @model.fetch().then (res) =>
      if res.message?
        @message res.message
      else
        @setMessage 'Welcome to the Hipster Stack!'

  setMessage: (message) ->
    @model.set 'message', message
    @model.save().then (res) => @message res.message


module.exports = HomeView
