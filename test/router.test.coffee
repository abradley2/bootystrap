require './helpers.coffee'
chai = require 'chai'
sinon = require 'sinon'


describe 'router:', ->
  beforeEach -> sinon.spy viewManager, 'render'

  it 'should return the router object', ->
    chai.assert.instanceOf router, Backbone.Router

  it 'each route should return a function', ->
    _.each router.routes, (route, url) ->
      chai.assert.isFunction route

  afterEach -> viewManager.render.restore()
