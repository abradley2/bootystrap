# Todo: I am quite happy with this router, however I think
# it still needs to handle horizantally aligned views
# and passing route parameters better

class Router extends Backbone.Router
  routes:
    ""      : "getHome"

  views:
    "defaultLayout":
      factory: require './layouts/default/default.coffee'
      isRendered: false
    "home":
      factory: require './views/home/home.coffee'
      parent: "defaultLayout"
      isRendered: false

  getHome: ->
    @cleanup 'home'
    return @createView 'home'

  cleanup: (newView) ->
    views = _.omit views, newView
    if @views[newView].parent?
      views = _.omit @views, @views[newView].parent
    _.each views, (view) =>
      view.isRendered = false
      if view.controller? then view.controller.remove()
      return
    return

  createView: (newView,params) ->
    if @views[newView].parent?
      if !@views[@views[newView].parent].isRendered
        @createView @views[newView].parent
    @views[newView].isRendered = true
    @views[newView].controller = new @views[newView].factory params
    @views[newView].controller.render()
    return @views[newView].controller

module.exports = Router
