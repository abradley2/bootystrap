class AboutView extends Backbone.View
  template: require './about.jade'
  el: '#content-region'

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

module.exports = AboutView
