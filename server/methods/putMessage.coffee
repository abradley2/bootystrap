putMessage = (message) ->
  console.log 'putMessage = ',message
  @db.put 'message', message

module.exports = putMessage
