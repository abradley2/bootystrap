window.$ = window.jQuery  = require 'jquery'
window._ = require 'lodash'
window.Backbone = require 'backbone'
window.ko = require 'knockout'

require '../src/app/bindings/index.coffee'
require '../src/app/components/index.coffee'

_.extend Backbone.View.prototype, require '../src/app/fn/viewUtils.coffee'
_.extend Backbone.Model.prototype, require '../src/app/fn/modelUtils.coffee'
_.extend Backbone.Collection.prototype, require '../src/app/fn/collectionUtils.coffee'

window.api = require '../src/app/api.coffee'
window.viewManager = require '../src/app/viewManager.coffee'
window.router = require '../src/app/router.coffee'

require './stubs.coffee'

Backbone.history.start()
