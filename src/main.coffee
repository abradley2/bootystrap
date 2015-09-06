window.$ = window.jQuery  = require 'jquery'
window._                  = require 'lodash'
window.Backbone           = require 'backbone'
require 'backbone-relational'

window.ko = require 'knockout'
ko.mapping = require 'knockout.mapping'
require './app/bindings/index.coffee'
require './app/components/index.coffee'

require '../node_modules/bootstrap/dist/js/npm.js'
window.moment             = require 'moment'
window.marked             = require 'marked'

window.Api                = require './app/Api.coffee'
window.Router             = require './app/Router.coffee'
window.ComponentLoader    = require './app/ComponentLoader.coffee'

$(document).ready ->
  window.events = {}
  _.extend events, Backbone.events
  window.api = new Api
  api.fetch().then ->
    ko.components.loaders.unshift(new ComponentLoader(api.get('viewModels'),api.get('templates')))
    window.router = new Router
    Backbone.history.start()
    return
  return
