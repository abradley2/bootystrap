class Tabs
  el: undefined

  constructor: (el) ->
    @el = el
    @el.children('li').first().children('a').addClass('is-active').next().addClass('is-open').show()
    @el.on 'click', 'li > a.tab-link', (event) =>
      if !$(event.target).hasClass 'is-active'
        event.preventDefault()
        @el.children('li').children('a').each ->
          $(this).removeClass 'is-active'
          $(this).next().removeClass('is-open').hide()
          return
        $(event.target).addClass('is-active').next().addClass('is-open').show()
      else
        event.preventDefault()
      return
    return

  dispose: ->
    @el.off 'click', 'li > a.tab-link'
    return

module.exports = Tabs
