class Router extends Backbone.Router

  getHierarchy = (routes) ->
    optionalParam = /\((.*?)\)/g
    namedParam    = /(\(\?)?:\w+/g
    splatParam    = /\*\w+/g
    escapeRegExp  = /[\-{}\[\]+?.,\\\^$|#\s]/g
    return

  initialize: (routes) ->
    _.each routes, (routeFunc, url) =>
      if _.isFunction routeFunc
        @route url, _.wrap routeFunc, (route) ->
          return viewManager.render route()
      else
        @route url, -> viewManager.render routeFunc

module.exports = new Router(
  require './routes/index.coffee'
)
