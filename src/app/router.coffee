class Router extends Backbone.Router

  initialize: (routes) ->
    @routes = routes
    _.each @routes, (route, url) => @route url, route

module.exports = new Router(
  require './routes/index.coffee'
)
