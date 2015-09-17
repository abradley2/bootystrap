class AboutView extends Backbone.View
  template: require './about.jade'
  el: '#content-region'

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

module.exports = AboutView
