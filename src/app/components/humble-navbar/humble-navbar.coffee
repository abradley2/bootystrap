class HumbleNavbar

  constructor: (params) ->
    console.log 'my navlinks = ',api.get('navlinks').models
    @navlinks = ko.observableArray api.get('navlinks').models
    @hasHome = ko.observable(false)
    return

  initComponent: (view) ->

    return

  dispose: ->

    return

module.exports = HumbleNavbar
