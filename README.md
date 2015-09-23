# Express + Backbone + Knockout

Backbone and Knockout are an _excellent_ combination. However, since Backbone
is a bare-minimum-almost-to-a-fault "framework" and Knockout is just a
data-binding library and not a framework at all, it can be confusing to find
a best practice for using the two together. This "stack" represents my idea of
how the two should be combined.

I aim for this to be opinionated enough to give a solid foundation, but not overly
opinionated such that it drills you into a corner or ruins Backbone's gift of
flexibility.

------

## Creating a Layout
Layouts are patterns for rendering collections of views *side by side*
(let knockout handle what would be "nested" views for the most part!).
Let's say some pages will have a sidebar, and some pages will not. To do this,
we will create two layouts.

In _/src/app/layouts_ create:  


_default.jade_  
```
div(class='container')
  div(id='content-region' class='col-sm-12')
```


_hasSidebar.jade_  
```
div(class='container')
  div(id='sidebar-region' class='col-sm-3')
  div(id='content-region' class='col-sm-9')
```  

Then *register* them in _/src/app/layouts/index.coffee_:  
```
exports.default = require './default.jade'

exports.hasSidebar = require './hasSidebar.jade'
```


## Creating a View
Now that we have some layouts, we need views for them to render! Create three
quick placeholders to demonstrate they will render and allow navigation.

In _/src/app/views/.._ create:  


### Home Page
_/home/home.jade_  
```
div
  h3 Home Placeholder
  a(href='#about') Go to the #about
```  
_/home/Home.coffee_
```
class HomeView extends Backbone.View
  template: require './home.jade'
  el: '#content-region'

module.exports = HomeView
```
### About Page
_/about/about.jade_
```
div
  h3 About Placeholder
  a(href='#home') Go to #home
```  
_/about/About.coffee_
```
class AboutView extends Backbone.View
  template: require './about.jade'
  el: '#content-region'

module.exports = AboutView
```
### Sidebar
_/sidebar/sidebar.jade_
```
div
  h3 Sidebar Placeholder
```
_/sidebar/Sidebar.coffee_
```
class SidebarView extends Backbone.View
  template: require './sidebar.jade'
  el: '#sidebar-region'

module.exports = SidebarView
```

Once again, we need to *register* these views in the _index.coffee_ file.
Here we will also associate each view with which layout they are rendered in.  
_/src/app/views/index.coffee_:  
```
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
```

This is as complicated as it gets fortunately. Just remember these steps.
1. The view.coffee file specifies the ID of the element it will render in, inside
its assigned Layout (i.e "el: '#content-region'")
2. The view.coffee file must also specify it's template file and require it
(i.e "template: require './home.jade'")
3. The view can have a *render* and a *remove* function that will each be called
automatically. If none are explicitly specified, the view will automatically use
the defaults.

## Creating a Route
To allow navigation, your router needs to know what to render in response to
changes in the URL.

## Components


## Custom Bindings


## The router and viewManager

## The "api"

This is left as pretty much a blank convention similar to the "render" method
on Backone.Views.

Backbone-Relational and Backbone-ORM are too very solid ways to organize your
models and collections.

# More Conventions

Here are some of the many strong side effects of using these libraries together.

## Views as Pages, Components as Views
In Backbone, nesting views in other views tends to be quite tricky. In Knockout,
nesting components in other components is trivial. For this reason, the layout
of this stack tends to use Backbone views as "layouts" and "page holders" while
Knockout is more in charge of filling in the content.  

Let's take for example a _deeply nested route_

## Dynamic Components
Use your Backbone.Views to change which HTML elements are rendered, and KO
will render the appropriate components.

## Using KnockBack.js
KnockBack.js integrates easily into this stack.
Require it in the src/app/index.coffee file and you're good to go!

## Using Marionnette
Adding Marrionette may be encroaching a bit on Knockout's territory

## Custom Component Loaders
Possibly one of my favorite features of knockout.js

## Using View events to coordinate components
