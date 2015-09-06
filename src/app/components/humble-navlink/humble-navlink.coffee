class HumbleNavlink

  constructor: (params) ->
    console.log 'I am a navlink: ',params
    @linkLabel = ko.observable params.get 'name'
    @linkDestination = ko.observable()

    if params.get('type') == 'category' or params.get('type') == 'subCategory'
      @linkDestination "#categories/" + params.get 'id'

    if params.get('type') == 'article'
      @linkDestination "#articles/" + params.get 'id'

    return

  initComponent: (view) ->
    # linkElement = $(view).parent()
    # linkElement.attr 'href', @linkDestination()
    return

  dispose: ->

    return

module.exports = HumbleNavlink
