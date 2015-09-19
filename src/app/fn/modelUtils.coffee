exports.fetchOnce = (callback) ->
  if @hasFetched?
    callback()
  else
    @hasFetched = true
    @fetch().then callback
