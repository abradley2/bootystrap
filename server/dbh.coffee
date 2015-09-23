# Uncomment after installing leveldb
levelup = require 'levelup'
db = levelup('./level');

dbh = {
  # insert methods for handling the db here
}

module.exports = dbh
