chai = require 'chai'
require './helpers.coffee'

describe 'router', ->
  router = require '../src/app/router.coffee'
  it 'should return the router object', ->
    chai.assert.instanceOf router, Backbone.Router
