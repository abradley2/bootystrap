# This test is here as a simple mocha/chai playground
chai = require 'chai'
require './helpers.coffee'

describe 'mocha and chai', ->
  it 'test libraries should be functioning', ->
    chai.assert.isTrue true, 'Mocha and Chai are running'

describe 'libs', ->
  it 'jQuery should be loaded', ->
    chai.assert.isDefined window.$
  it 'lodash should be loaded', ->
    chai.assert.isDefined window._
  it 'Backbone should be loaded', ->
    chai.assert.isDefined window.Backbone
  it 'knockout should be loaded', ->
    chai.assert.isDefined window.ko

describe 'document', ->
  $(document).html "<html><body><div id='application-region'></div></body></html>"
  console.log $(document).html()
