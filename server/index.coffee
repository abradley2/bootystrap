# Application
app = require './app.coffee'

# Routes
site = require './routes/site.coffee'
message = require './routes/message.coffee'

# Handle Routes
app.get '/', site.home
app.get '/message', message.getMessage
app.post '/message', message.putMessage

# Start Server
server = app.listen 3000, -> console.log 'start me up!'
