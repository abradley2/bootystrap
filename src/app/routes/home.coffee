home = (params) ->
  viewManager.render {
    layout: 'default'
    views: ['navigation','home']
  }, params

module.exports = home
