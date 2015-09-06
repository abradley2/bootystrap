class HumbleDropdownNav

  constructor: (params) ->
    @name = ko.observable params.get 'name'
    @subCategories = ko.observableArray params.get 'subCategories'
    return

  initComponent: (view) ->
    @dropdownMenu = $(view).dropdown()
    return

  dispose: ->
    # Todo, may need to add disposal logic for the dropdown
    return

module.exports = HumbleDropdownNav
