class Router extends Backbone.Router
  routes: {}

  views: {}

  #getHome: -> @createView @cleanup('home')

  initialize: ->
    @navigation = new (require './views/navigation/Navigation.coffee')
    @navigation.render()
    _.each @views, (view) -> view.isRendered = false

  cleanup: (newView) ->
    views = _.omit @views, newView
    _.each views, (view) =>
      view.isRendered = false
      if view.controller? then view.controller.remove()
      view.controller = null
      return
    return newView

  createView: (newView,params) ->
    @views[newView].isRendered = true
    if !@views[newView].controller?
      @views[newView].controller = new @views[newView].factory
    @views[newView].controller.render params
    return @views[newView].controller

module.exports = Router
