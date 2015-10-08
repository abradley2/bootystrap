home = () ->
  return {
    layout: 'default'
    views:
      '#navigation-region': 'navigation'
      '#content-region': 'home'
  }

module.exports = home
