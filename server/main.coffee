express             = require 'express'
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

app.set 'views', __dirname + '/views'
app.set 'view engine', 'jade'

app.get '/', (req, res) -> res.render 'main', {theme: db.appSetings.theme}

app.get '/api', (req, res) -> res.json {
    categories: db.categories
    userImages: db.userImages
    userDocs: db.userDocs
    userComponents: db.userComponents
    userTemplates: db.userTemplates
  }

app.get '/designer', (req, res) -> res.render 'designer', {theme: db.appSettings.theme}

server = app.listen 3000
