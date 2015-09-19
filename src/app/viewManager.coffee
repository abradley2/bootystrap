class ViewManager extends Backbone.View
  el: '#application-region'
  layouts: require './layouts/index.coffee'
  views: require './views/index.coffee'

  initialize: ->
    _.each @views, (view) => view.isRendered = false
    _.each @layouts, (layout) => layout.isRendered = false

  render: (options, params) ->
    @cleanupViews options.views
    @renderLayout options.layout
    @renderView options.views, params

  renderLayout: (layout) ->
    if !@layouts[layout].isRendered
      @$el.html @layouts[layout]()
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
