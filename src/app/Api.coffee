class Api extends Backbone.RelationalModel
  eventDebug: true
  url: 'api'
  relations: [
    {
      type: 'HasMany'
      key: 'categories'
      relatedModel: require './data/Category.coffee'
      collectionType: require './data/Categories.coffee'
      reverseRelation:
        type: 'HasOne'
        key: 'api'
    }
    {
      type: 'HasMany'
      key: 'components'
      relatedModel: require './data/Component.coffee'
      collectionType: require './data/Components.coffee'
      reverseRelation:
        type: 'HasOne'
        key: 'api'
    }
    {
      type: 'HasMany'
      key: 'templates'
      relatedModel: require './data/Template.coffee'
      collectionType: require './data/Templates.coffee'
      reverseRelation:
        type: 'HasOne'
        key: 'api'
    }
    {
      type: 'HasMany'
      key: 'documents'
      relatedModel: require './data/Document.coffee'
      collectionType: require './data/Documents.coffee'
      reverseRelation:
        type: 'HasOne'
        key: 'api'
    }
    {
      type: 'HasMany'
      key: 'images'
      relatedModel: require './data/Image.coffee'
      collectionType: require './data/Images.coffee'
      reverseRelation:
        type: 'HasOne'
        key: 'api'
    }
  ]
  initialize: ->

    return

module.exports = Api
