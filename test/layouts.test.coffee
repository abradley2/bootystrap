chai = require 'chai'
require './helpers.coffee'

describe 'layouts', ->
  layouts = require '../src/app/layouts/index.coffee'
  it 'src/app/layouts/index should give an index of all layouts', ->
    _.each layouts, (template, name) ->
      chai.assert.typeOf template(), 'string'
