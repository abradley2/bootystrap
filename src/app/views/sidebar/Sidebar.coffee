class SidebarView extends Backbone.View
  template: require './sidebar.jade'
  el: '#sidebar-region'

  render: ->
    @setElement @el
    @$el.html @template()
    ko.cleanNode @el
    ko.applyBindings {}, @el

  remove: ->
    ko.cleanNode @el
    @$el.empty()
    @stopListening()
    @unbind()

module.exports = SidebarView
