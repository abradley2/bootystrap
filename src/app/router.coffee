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
    @createView 'home'
    return

  cleanup: (newView) ->
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
    return

module.exports = Router
