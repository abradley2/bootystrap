ko.components.register 'humble-navbar',
  viewModel: require './humble-navbar/humble-navbar.coffee'
  template: (require './humble-navbar/humble-navbar.jade')()

ko.components.register 'humble-navlink',
  viewModel: require './humble-navlink/humble-navlink.coffee'
  template: (require './humble-navlink/humble-navlink.jade')()

ko.components.register 'humble-nav-dropdown',
  viewModel: require './humble-nav-dropdown/humble-nav-dropdown.coffee'
  template: (require './humble-nav-dropdown/humble-nav-dropdown.jade')()
