express = require 'express'
bodyParser          = require 'body-parser'
clientSessions      = require 'client-sessions'
db                  = require './db.coffee'

app = express()
app.use express.static './public'
app.use bodyParser.json()
app.use bodyParser.urlencoded extended: false
app.use clientSessions
  cookieName: 'TonyCodesSession'
  secret: 'thisshitisbananasbeeayyennayyennayyess'

app.get '/', (req, res) ->
  res.sendFile './public/index.html', root: __dirname
  return

server = app.listen 3000
