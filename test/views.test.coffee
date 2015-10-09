chai = require 'chai'
sinon = require 'sinon'
require './helpers.coffee'

describe 'views:', ->
  _.each viewManager.views, (view, name) ->
    sut = new view.factory()
    it "view = \"#{name}\" should have render and remove functions", ->
      chai.assert.isFunction sut.render
      chai.assert.isFunction sut.remove
    it "view = \"#{name}\" should have a template", ->
      chai.assert.isFunction sut.template
