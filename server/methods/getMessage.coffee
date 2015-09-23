getMessage = ->
  return @db.get 'message'

module.exports = getMessage
