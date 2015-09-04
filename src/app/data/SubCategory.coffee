class SubCategory extends Backbone.RelationalModel
  relations: [
    {
      type: 'HasOne'
      key: 'page'
      relatedModel: require './Page.coffee'
      reverseRelation:
        type: 'HasOne'
        key: 'subCategory'
    }
    {
      type: 'HasMany'
      key: 'pages'
      relatedModel: require './Page.coffee'
      collectionType: require './Pages.coffee'
      reverseRelation:
        type: 'HasOne'
        key: 'subCategory'
    }
  ]

module.exports = SubCategory
