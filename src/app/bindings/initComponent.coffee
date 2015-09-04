ko.bindingHandlers.initComponent = {
  init: (elem, value, allBindings, viewModel, bindingContext) ->
    if viewModel and typeof viewModel.initComponent == 'function'
      viewModel.initComponent elem
    return
}
