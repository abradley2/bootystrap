class Api
  data:
    user: require './data/user.coffee'

  constructor: ->
    _.each @data, (factory, name) =>
      @data[name] = new factory
      return
    return

  get: (model) =>
    return @data[model]

module.exports = Api
