class Navigation extends Backbone.View
  el: '#navigation-container'
  template: require './navigation.jade'

  render: ->
    @$el.html @template()
    ko.applyBindings api.get('categories'), @el
    return

  remove: ->
    ko.cleanNode @el
    @$el.empty()
    return

module.exports = Navigation
