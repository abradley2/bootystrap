# Application
app = require './app.coffee'

# Database Handler
dbh = require './dbh.coffee'

# Routes
site = require './routes/site.coffee'

# Handle Routes
app.get '/', site.home

# Start Server
server = app.listen 3000
