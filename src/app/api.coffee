# I suggest using Backbone.Relational here, but if you'd rather keep it simple
# then I recommend the model -> collection -> model -> ... pattern

class Api extends Backbone.Model

  initialize: ->
    _.each (require './data/index.coffee'), (dataStore, name) =>
      @set name, new dataStore()

module.exports = new Api()
