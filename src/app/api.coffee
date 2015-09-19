class Api extends Backbone.RelationalModel
  relations: require './data/index.coffee'

module.exports = new Api()
