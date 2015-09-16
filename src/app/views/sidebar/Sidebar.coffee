class SidebarView extends Backbone.View
  template: require './sidebar.jade'
  el: '#sidebar-region'

  initialize: ->
    # always reset element on initialization in case the layout has been switched
    @setElement @el
    return

  render: ->
    @$el.html @template()
    console.log 'sidebar rendered',this,@$el.html()
    return

  remove: ->
    @$el.empty()
    @stopListening()
    @unbind()
    return

module.exports = SidebarView
