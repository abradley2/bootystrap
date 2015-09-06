class HumbleDropdownNav

  constructor: (params) ->
    @name = ko.observable params.get 'name'
    @listItems = ko.observableArray()
    if params.get('type') == 'articleGroup' then @listItems params.get('articles').models
    if params.get('type') == 'categoryGroup' then @listItems params.get('categories').models
    
    return

  initComponent: (view) ->
    @dropdownMenu = $(view).dropdown()
    return

  dispose: ->
    # Todo, may need to add disposal logic for the dropdown
    return

module.exports = HumbleDropdownNav
