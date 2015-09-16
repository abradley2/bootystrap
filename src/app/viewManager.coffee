class ViewManager extends Backbone.View
  el: '#application-region'
  layouts: require './layouts/index.coffee'
  views: require './views/index.coffee'

  initialize: ->
    _.each @views, (view) => view.isRendered = false
    _.each @layouts, (layout) => layout.isRendered = false

  render: (view, params) -> @createView @cleanup(view), params

  renderLayout: (layout) ->
    if !@layouts[layout].isRendered
      @$el.html @layouts[layout]()
      @layouts[layout].isRendered = true
    _.each _.omit(@layouts, layout), (layout) -> layout.isRendered = false

  cleanup: (newView) ->
    _.each _.omit(@views, newView), (view) =>
      view.isRendered = false
      if view.controller? then view.controller.remove()
      view.controller = null
    return newView

  createView: (newView, params) ->
    if _.isArray(newView)
      _.each newView, (view) => @createView(view, params)
    else
      @renderLayout @views[newView].layout
      @views[newView].isRendered = true
      if !@views[newView].controller?
        @views[newView].controller = new @views[newView].factory
      @views[newView].controller.render params
      return @views[newView].controller

module.exports = new ViewManager()
