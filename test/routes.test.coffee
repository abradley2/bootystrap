require './helpers.coffee'
chai = require 'chai'
sinon = require 'sinon'


describe 'routes:', ->
  beforeEach -> sinon.spy viewManager, 'render'

  _.each router.routes, (route, url) ->
    it "url = #{url} should give viewManager an object with views", ->
      route()
      chai.assert.isObject viewManager.render.lastCall.args[0].views

  _.each router.routes, (route, url) ->
    it "url = #{url} should call the viewManager's render function", ->
      route()
      chai.assert.equal viewManager.render.callCount, 1

  afterEach -> viewManager.render.restore()
