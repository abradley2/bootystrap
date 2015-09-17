exports._render = (params) ->
  @setElement @el
  @$el.html @template()
  ko.cleanNode @el
  ko.applyBindings {params: params, view: this}, @el

exports._remove = ->
  ko.cleanNode @el
  @$el.empty()
  @stopListening()
  @unbind()
