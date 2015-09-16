class Api extends Backbone.RelationalModel
  eventDebug: true
  relations: require './data/index.coffee'

module.exports = new Api()
