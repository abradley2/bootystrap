# Define the layout and view-factory of each view that can be rendered
# by the viewManager

exports.home = {
  factory: require './home/Home.coffee'
}

exports.about = {
  factory: require './about/About.coffee'
}

exports.sidebar = {
  factory: require './sidebar/Sidebar.coffee'
}

exports.navigation = {
  factory: require './navigation/Navigation.coffee'
}
