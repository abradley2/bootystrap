class ComponentLoader
  constructor: (viewModels, templates) ->
    @viewModels = viewModels
    @templates = templates
    return

  loadTemplate: (name, templateConfig, callback) ->
    if @templates.get(name)?
      window.require ['js/text!templates/' + name + '.html'], (template) ->
        ko.components.defaultLoader.loadTemplate name, template, callback
        return
    else
      callback null
    return

  loadViewModel: (name, viewModelConfig, callback) ->
    if @viewModels.get(name)?
      window.require ['viewModels/' + name + '.js'], (viewModel) ->
        ko.components.defaultLoader.loadViewModel name, viewModel, callback
    else
      callback null
    return

module.exports = ComponentLoader
