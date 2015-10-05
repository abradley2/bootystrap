class ViewManager extends Backbone.View

  parseFactories = (factoryArray) ->
    retVal = {}
    _.each factoryArray, (factory, name) ->
      retVal[name] = {
        factory: factory
        isRendered: false
      }
    return retVal

  initialize: (params) ->
    _.extend this, Backbone.Events
    @region = params.el
    @views = parseFactories params.views
    @layouts = parseFactories params.layouts

  render: (renderConfig, routeParams) ->
    @setElement @region
    @cleanupViews _.values renderConfig.views
    @renderLayout renderConfig.layout
    @renderViews renderConfig.views, routeParams

  remove: ->
    @cleanupViews()
    @$el.empty()

  renderLayout: (layout) ->
    if !@layouts[layout].isRendered
      @$el.html @layouts[layout].factory()
      @layouts[layout].isRendered = true
    _.each _.omit(@layouts, layout), (layout) -> layout.isRendered = false
    # return for testing
    return @$el.html()

  cleanupViews: (omitViews) ->
    _.each _.omit(@views, omitViews), (view) =>
      view.isRendered = false
      if view.controller?
        view.controller.remove()
      view.controller = null

  renderViews: (newViews, routeParams) ->
    _.each newViews, (newView, el) =>
      @views[newView].isRendered = true
      if !@views[newView].controller?
        @views[newView].controller = new @views[newView].factory()
      @views[newView].controller.setElement el
      @views[newView].controller.render routeParams
    # return for testing
    return _.pick @views, _.values(newViews)

module.exports = new ViewManager(
  views: require('./views/index.coffee')
  layouts: require('./layouts/index.coffee')
  el: 'body'
)

# views: collection of view names (keys) and factory functions (values)
# that output a Backbone.View

# layouts: collection of layout names (keys) and template/strings (values)
