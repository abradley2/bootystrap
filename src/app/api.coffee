class Api extends Backbone.RelationalModel
  eventDebug: true
  relations: [
    {
      type: Backbone.HasOne
      key: 'user'
      relatedModel: require './data/userModel.coffee'
      reverseRelation:
        type: 'HasOne'
        key: 'api'
    }
  ]
  initialize: ->
    @set 'user', {id: 'user'}
    return

module.exports = Api
