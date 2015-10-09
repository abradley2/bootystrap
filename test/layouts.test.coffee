require './helpers.coffee'
chai = require 'chai'


describe 'layouts:', ->
  it 'All layouts in the viewManager should be templates', ->
    _.each viewManager.layouts, (layout, name) ->
      chai.assert.typeOf layout.factory(), 'string'
