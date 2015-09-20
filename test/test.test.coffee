chai = require 'chai'
require './helpers.coffee'

describe 'oneself', ->
  it 'chai should be working', ->
    chai.assert.isDefined chai
    console.log $('body').html()
