class MessageModel extends Backbone.Model
  url: '/message'
  initialize: (parent) ->
    @set 'api', parent

module.exports = MessageModel
