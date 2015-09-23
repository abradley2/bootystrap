exports.getMessage = (req, res) ->
  @db.get 'message', (err, value) ->
    res.json message: value

exports.putMessage = (req, res) ->
  @db.put 'message', req.message
