# Define the layout and view-factory of each view that can be rendered
# by the viewManager

exports.home = {
  layout: 'default'
  factory: require './home/Home.coffee'
}

exports.about = {
  layout: 'double'
  factory: require './about/About.coffee'
}

exports.sidebar = {
  layout: 'double'
  factory: require './sidebar/Sidebar.coffee'
}
