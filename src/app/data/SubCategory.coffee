class SubCategory extends Backbone.RelationalModel
  relations: [
    {
      type: 'HasMany'
      key: 'articles'
      relatedModel: require './Article.coffee'
      collectionType: require './Articles.coffee'
      reverseRelation:
        type: 'HasOne'
        key: 'subCategory'
    }
  ]

module.exports = SubCategory
