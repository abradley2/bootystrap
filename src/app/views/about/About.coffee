class AboutView extends Backbone.View
  template: require './about.jade'
  el: '#content-region'

  initialize: ->
    # always reset element on initialization in case the layout has been switched
    @setElement @el
    return

  render: ->
    @$el.html @template()
    console.log 'about rendered',this,@$el.html()
    return

  remove: ->
    @$el.empty()
    @stopListening()
    @unbind()
    return

module.exports = AboutView
