sinon = require 'sinon'

ajaxStub = sinon.stub $, 'ajax', (req) ->
  if req.url = '/message' and req.type = 'GET'
    return $.Deferred().resolve require('./fixtures/message.coffee')
