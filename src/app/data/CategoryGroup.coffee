class CategoryGroup extends Backbone.RelationalModel
  idAttribute: 'guid'
  relations: [
    {
      type: 'HasMany'
      key: 'categories'
      relatedModel: require './Category.coffee'
      collectionType: require './Categories.coffee'
      reverseRelation:
        type: 'HasOne'
        key: 'categoryGroup'
    }
  ]
