exports.fetchOnceById = (id, callback) ->
  idAttribute = 'id'
  modelId = id
  if _.isObject id
    idAttribute = _.findKey id, true
    modelId = id[idAttribute]
  if @get(modelId)?
    @get(modelId).fetchOnce callback
  else
    @add(_.object [[idAttribute, modelId]]).fetchOnce callback

exports.fetchOnce = (callback) ->
  if @hasFetched?
    callback()
  else
    @hasFetched = true
    @fetch().then callback

exports.fetchById = (id, callback) ->
  modelId = @modelId()
  if @get(modelId)?
    @get(modelId).fetch().then callback
  else
    @add(_.object [modelId, id]).fetch callback
