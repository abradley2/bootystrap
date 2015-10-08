chai = require 'chai'
sinon = require 'sinon'
require './helpers.coffee'

describe 'router:', ->
  beforeEach -> sinon.spy viewManager, 'render'

  it 'should return the router object', ->
    chai.assert.instanceOf router, Backbone.Router

  it 'each route should return a function', ->
    _.each router.routes, (route, url) ->
      chai.assert.isFunction route

  it 'routes should wrap the viewManager\'s render function', ->

    expectedCalls = 1
    _.each router.routes, (route, url) ->
      route()
      chai.assert.equal viewManager.render.callCount, expectedCalls
      expectedCalls++

  afterEach -> viewManager.render.restore()
