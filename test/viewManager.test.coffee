chai = require 'chai'
require './helpers.coffee'

describe 'viewManager:', ->
  it 'should have renderViews function', ->
    chai.assert.isFunction viewManager.renderViews
  it 'should have renderLayout function', ->
    chai.assert.isFunction viewManager.renderLayout
  it 'should create factories for views', ->
    _.each viewManager.views, (view) ->
      chai.assert.property view, 'factory'
      chai.assert.property view, 'isRendered'
  it 'should create factories for layouts', ->
    _.each viewManager.layouts, (layout) ->
      chai.assert.property layout, 'factory'
      chai.assert.property layout, 'isRendered'
