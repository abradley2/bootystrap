window.$ = window.jQuery  = require 'jquery'
window._                  = require 'lodash'
window.Backbone           = require 'backbone'
require 'backbone-relational'
window.ko                 = require 'knockout'
require './bindings/index.coffee'
require './components/index.coffee'

# If you need to use additional libraries, require them here

$(document).ready ->
  window.events       = _.extend {}, Backbone.Events
  window.api          = require './api.coffee'
  window.viewManager  = require './viewManager.coffee'
  window.router       = require './router.coffee'
  Backbone.history.start()
  return
