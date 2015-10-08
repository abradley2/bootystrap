class Router extends Backbone.Router
  routes: require './routes/index.coffee'

  getHierarchy = (routes) ->
    optionalParam = /\((.*?)\)/g
    namedParam    = /(\(\?)?:\w+/g
    splatParam    = /\*\w+/g
    escapeRegExp  = /[\-{}\[\]+?.,\\\^$|#\s]/g
    return

  initialize: ->
    _.each @routes, (routeFunc, url) =>
      if _.isFunction routeFunc
        @routes[url] = _.wrap routeFunc, (route) ->
          return viewManager.render route()
      else
        @routes[url] = -> viewManager.render routeFunc

module.exports = new Router()
