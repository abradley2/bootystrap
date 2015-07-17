window.$ = window.jQuery  = require 'jquery'
window._                  = require 'lodash'
window.Backbone           = require 'backbone'
window.components         = require './styles/main.coffee'
window.Api                = require './app/api.coffee'
window.Router             = require './app/router.coffee'

$(document).ready ->
  window.events = {}
  _.extend events, Backbone.events
  window.api = new Api
  window.router = new Router
  Backbone.history.start()
  return
