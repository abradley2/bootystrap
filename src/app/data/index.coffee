# All models here will be accessible through the global api.get() accessor.
# No need to add models that are meant to only be accessed nested in others.

module.exports = [
  {
    type: Backbone.HasOne
    key: 'user'
    relatedModel: require './UserModel.coffee'
    reverseRelation:
      type: 'HasOne'
      key: 'api'
  }
]
