class DefaultLayout extends Backbone.View
  el: '#application'
  template: require './default.jade'

  render: ->
    @$el.html @template()
    return

  close: ->
    @$el.empty()
    @unbind()
    return

module.exports = DefaultLayout
