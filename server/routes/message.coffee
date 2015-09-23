dbh = require('../dbh.coffee')

exports.getMessage = (req, res) ->
  dbh.get 'message', (err, value) ->
    res.json message: value

exports.putMessage = (req, res) ->
  dbh.put 'message', req.message
