# Uncomment after installing leveldb
levelup = require 'levelup'
db = levelup('./level');


module.exports = db
