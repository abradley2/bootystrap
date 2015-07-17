class HomeView extends Backbone.View
  template: require './home.haml'
  el: '#content-region'

  initialize: =>
    @setElement @el
    return

  render: ->
    @$el.html @template()
    return

  remove: ->
    @$el.empty()
    @stopListening()
    @unbind()
    return

module.exports = HomeView
