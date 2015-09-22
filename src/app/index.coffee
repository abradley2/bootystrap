window.$ = window.jQuery  = require 'jquery'
window._ = require 'lodash'
window.Backbone = require 'backbone'
window.ko = require 'knockout'
require 'backbone-relational'
require './bindings/index.coffee'
require './components/index.coffee'

# If you need to use additional libraries, require them here

_.extend Backbone.View.prototype, require './fn/viewUtils.coffee'
_.extend Backbone.Model.prototype, require './fn/modelUtils.coffee'
_.extend Backbone.Collection.prototype, require './fn/collectionUtils.coffee'

$(document).ready ->
  window.events       = _.extend {}, Backbone.Events
  window.api          = require './api.coffee'
  window.viewManager  = require './viewManager.coffee'
  window.router       = require './router.coffee'
  Backbone.history.start()
  return
