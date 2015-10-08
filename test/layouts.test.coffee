chai = require 'chai'
require './helpers.coffee'

describe 'layouts:', ->
  it 'All layouts in the viewManager should be templates or strings', ->
    _.each viewManager.layouts, (layout, name) ->
      chai.assert.typeOf layout.factory(), 'string'
