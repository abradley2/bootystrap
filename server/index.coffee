# Application
app = require './app.coffee'

# Database Handler
app.dbh = require './dbh.coffee'

# Routes
site = require './routes/site.coffee'
message = require './routes/message.coffee'

# Handle Routes
app.get '/', site.home
app.get '/message', message.getMessage
app.put '/message', message.putMessage

# Start Server
server = app.listen 3000
