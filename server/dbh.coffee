# Database Handler

levelup = require 'levelup'

dbh = levelup('./level')

module.exports = dbh
