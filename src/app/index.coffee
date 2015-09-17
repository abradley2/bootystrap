window.$ = window.jQuery  = require 'jquery'
window._ = require 'lodash'
window.Backbone = require 'backbone'
require 'backbone-relational'
window.ko = require 'knockout'
require './bindings/index.coffee'
require './components/index.coffee'

# If you need to use additional libraries, require them here


Backbone.KnockoutView = Backbone.View.extend require './fn/viewUtils.coffee'
_.extend Backbone.Model, require './fn/modelUtils.coffee'
_.extend Backbone.Collection, require './fn/collectionUtils.coffee'

$(document).ready ->
  window.events       = _.extend {}, Backbone.Events
  window.api          = require './api.coffee'
  window.viewManager  = require './viewManager.coffee'
  window.router       = require './router.coffee'
  Backbone.history.start()
  return
