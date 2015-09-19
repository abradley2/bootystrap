exports.render = (params) ->
  @setElement @region
  @$el.html @template()
  ko.cleanNode @el
  ko.applyBindings {params: params, view: this}, @el

exports.remove = ->
  ko.cleanNode @el
  @$el.empty()
  @stopListening()
  @unbind()
