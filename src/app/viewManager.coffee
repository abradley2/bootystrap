class ViewManager extends Backbone.View

  parseFactories = (factoryArray) ->
    retVal = {}
    _.each factoryArray, (factory, name) ->
      retVal[name] = {
        factory: factory
        isRendered: false
      }
    return retVal

  initialize: ->
    @setElement 'body'
    @views = parseFactories require './views/index.coffee'
    @layouts = parseFactories require './layouts/index.coffee'

  render: (options, params) ->
    @cleanupViews options.views
    @renderLayout options.layout
    @renderView options.views, params

  renderLayout: (layout) ->
    if !@layouts[layout].isRendered
      @$el.html @layouts[layout].factory()
      @layouts[layout].isRendered = true
    _.each _.omit(@layouts, layout), (layout) -> layout.isRendered = false

  cleanupViews: (newView) ->
    _.each _.omit(@views, newView), (view) =>
      view.isRendered = false
      if view.controller?
        view.controller.remove()
      view.controller = null

  renderView: (newView, params) ->
    if _.isArray(newView)
      _.each newView, (view) => @renderView(view, params)
    else
      @views[newView].isRendered = true
      if !@views[newView].controller?
        @views[newView].controller = new @views[newView].factory
      @views[newView].controller.render params
      return @views[newView].controller

module.exports = new ViewManager()
