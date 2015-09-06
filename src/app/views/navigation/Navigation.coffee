class Navigation extends Backbone.View
  el: '#navigation-container'
  template: require './navigation.jade'

  initialize: ->
    remove: ->
    _.each @subViews, (obj, view) ->
      obj.controller.remove()
      obj.controller = null
      return
    @stopListening()
    @undelegateEvents()
    @unbind()
    @$el.empty()
    return
    returnremove: ->
    _.each @subViews, (obj, view) ->
      obj.controller.remove()
      obj.controller = null
      return
    @stopListening()
    @undelegateEvents()
    @unbind()
    @$el.empty()
    return

  render: ->
    @$el.html @template()
    ko.applyBindings api.get('categories'), @el
    return

  remove: ->
    ko.cleanNode @el
    @undelegateEvents()
    @unbind()
    @stopListening()
    @$el.empty()
    return

module.exports = Navigation
