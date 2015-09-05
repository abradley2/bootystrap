class Article extends Backbone.RelationalModel
  relations: [
    {
      type: 'HasMany'
      key: 'pages'
      relatedModel: require './Page.coffee'
      collectionType: require './Pages.coffee'
      reverseRelation:
        type: 'HasOne'
        key: 'article'
    }
  ]

module.exports = Article
