chai = require 'chai'
require './helpers.coffee'

describe 'router indices', ->
  routes = require '../src/app/routes/index.coffee'
  it 'each route should return a function', ->
    _.each routes, (route, url) ->
      chai.assert.typeOf route, 'function'
