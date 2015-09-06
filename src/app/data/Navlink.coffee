class Navlink extends Backbone.RelationalModel
  idAttribute: 'guid'
  relations: [
    {
      type: 'HasMany'
      key: 'categories'
      relatedModel: require './Category.coffee'
      collectionType: require './Categories.coffee'
      reverseRelation:
        type: 'HasOne'
        key: 'navlink'
    }
    {
      type: 'HasMany'
      key: 'articles'
      relatedModel: require './Article.coffee'
      collectionType: require './Articles.coffee'
      reverseRelation:
        type: 'HasOne'
        key: 'navlink'
    }
  ]

module.exports = Navlink
