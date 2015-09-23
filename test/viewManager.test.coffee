chai = require 'chai'
require './helpers.coffee'

describe 'viewManager', ->
  viewManager = require '../src/app/viewManager.coffee'
  it 'should have renderView function', ->
    chai.assert.isFunction viewManager.renderView
  it 'should have renderLayout function', ->
    chai.assert.isFunction viewManager.renderLayout
