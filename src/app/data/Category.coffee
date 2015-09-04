class Category extends Backbone.RelationalModel
  relations: [
    {
      type: 'HasOne'
      key: 'page'
      relatedModel: require './Page.coffee'
      reverseRelation:
        type: 'HasOne'
        key: 'category'
    }
    {
      type: 'HasMany'
      key: 'pages'
      relatedModel: require './Page.coffee'
      collectionType: require './Pages.coffee'
      reverseRelation:
        type: 'HasOne'
        key: 'category'
    }
    {
      type: 'HasMany'
      key: 'subCategories'
      relatedModel: require './SubCategory.coffee'
      collectionType: require './SubCategories.coffee'
      reverseRelation:
        type: 'HasOne'
        key: 'category'
    }
  ]

module.exports = Category
