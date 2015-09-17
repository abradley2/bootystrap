class SidebarView extends Backbone.View
  template: require './sidebar.jade'
  el: '#sidebar-region'

  initialize: ->
    # always reset element on initialization in case the layout has been switched
    @setElement @el
    return

  render: ->
    @$el.html @template()
    return

  remove: ->
    ko.cleanNode @el
    @$el.empty()
    @stopListening()
    @unbind()
    return

module.exports = SidebarView
