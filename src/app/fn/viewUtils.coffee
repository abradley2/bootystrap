exports.render = (params) ->
  if @beforeRender? then @beforeRender()
  @setElement @region
  @$el.html @template()
  ko.cleanNode @el
  ko.applyBindings {params: params, view: this}, @el
  if @afterRender? then @afterRender()

exports.remove = ->
  if @beforeRemove? then beforeRemove()
  ko.cleanNode @el
  @$el.empty()
  @stopListening()
  @unbind()
  if @afterRemove? then afterRemove()
