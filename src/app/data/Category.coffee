class Category extends Backbone.RelationalModel
  relations: [
    {
      type: 'HasMany'
      key: 'articles'
      relatedModel: require './Article.coffee'
      collectionType: require './Articles.coffee'
      reverseRelation:
        type: 'HasOne'
        key: 'category'
    }
  ]

module.exports = Category
