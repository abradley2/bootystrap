# All models here will be accessible through the global api.get() accessor.
# No need to add models that are meant to only be accessed nested in others.

exports.message = require './MessageModel.coffee'
