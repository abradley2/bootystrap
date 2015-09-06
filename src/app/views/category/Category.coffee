class Category extends Backbone.View
  template: require './category.jade'
  el: '#main-content-container'

  initialize: ->

    return

  render: (params) ->
    @setElement @el
    @$el.html @template()
    ko.cleanNode @el
    ko.applyBindings {categoryId: params}, @el
    return

  remove: ->
    ko.cleanNode @el
    @undelegateEvents()
    @unbind()
    @stopListening()
    @$el.empty()
    return

module.exports = Category
