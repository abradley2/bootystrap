express = require 'express'
app = express()
app.use express.static './public'

app.get '/', (req, res) ->
  res.sendFile './public/index.html', root: __dirname
  return

server = app.listen 3000
