about = (params) ->
  viewManager.render {
    layout: 'withSidebar'
    views: ['navigation','sidebar','about']
  }, params

module.exports = about
