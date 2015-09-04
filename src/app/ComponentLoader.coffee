class ComponentLoader
  constructor: (components) ->
    @components = components
    console.log 'my components = ',@components
    return

  loadTemplate: (name, templateConfig, callback) ->
    if @components.get(name)?
      ko.components.defaultLoader.loadTemplate name, window.require 'text!userComponents/#{name}.html', callback
    else
      callback null
    return

  loadViewModel: (name, viewModelConfig, callback) ->
    if @components.get(name)>
      ko.components.defaultLoader.loadViewModel name, window.require '/userComponents/#{name}.js', callback
    else
      callback null
    return

module.exports = ComponentLoader
