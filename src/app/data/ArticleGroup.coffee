class ArticleGroup extends Backbone.RelationalModel
  idAttribute: 'guid'
  relations: [
    {
      type: 'HasMany'
      key: 'articles'
      relatedModel: require './Article.coffee'
      collectionType: require './Articles.coffee'
      reverseRelation:
        type: 'HasOne'
        key: 'articleGroup'
    }
  ]

module.exports = ArticleGroup
