chai = require 'chai'
require './helpers.coffee'

describe 'oneself', ->
  it 'chai should be working', ->
    chai.assert.isDefined chai
  it 'phantomJS should create headless pages', ->
    chai.assert.typeOf $("body").html(), 'string'
