chai = require 'chai'
sinon = require 'sinon'


describe 'routes:', ->
  beforeEach -> sinon.spy viewManager, 'render'
  _.each router.routes, (route, url) ->
    it "url = #{url} should return an object with views", ->
      route()
      chai.assert.isObject viewManager.render.lastCall.args[0].views

  afterEach -> viewManager.render.restore()
