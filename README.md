# Express + Backbone + Knockout

Backbone and Knockout are an _excellent_ combination. However, since Backbone
is a bare-minimum-almost-to-a-fault "framework" and Knockout is just a
data-binding library and not a framework at all, it can be confusing to find
a best practice for using the two together. This "stack" represents my idea of
how the two should be combined.

I aim for this to be opinionated enough to give a solid foundation, but not
opinionated to the point it drills you into a corner or ruins Backbone's gift of
flexibility.

### Basics
1. [Create Layout](#CreateLayout)
2. [Create View](#CreateView)
3. [Create Route](#CreateView)
4. [Using Links](#Links)

### The Hipster Stack
1. [Extended Views](#ViewApi)
2. [View Manager](#ViewManager)
3. [Router and Parameters](#Router)
4. [Models and Collections](#ModelsAndCollections)
------

## Build Steps
After downloading and extracting:
1. _npm install_
2. _npm run build_
3. _npm run test_
4. _npm run start_ (defaults to env localhost:3000)

Development Build/Watch:
1. _npm install_
2. _npm run watch-client_ (will build the client with watchify to update during development)
3. _npm run watch-server_ (will run the server under nodemon to update during development)

<a name="CreateLayout"></a>
## Creating a Layout
Layouts are patterns for rendering collections of views *side by side*
(let knockout handle "nested views").
There is already a default layout as an example.

In _/src/app/layouts_ create:  

_hasSidebar.jade_  
```
div(class='container')
  div(id='sidebar-region' class='col-sm-3')
  div(id='content-region' class='col-sm-9')
```  

Then *register* this view in the _index.coffee_ file in the same folder.
```
exports.hasSidebar = require './hasSidebar.jade'
```

<a name="CreateView"></a>
## Creating a View
When you have a view with regions that can be referenced by id, the next step
is to create views to render inside them. A sample view:

In _/src/app/views/.._ create:  

_/sidebar/sidebar.jade_ (the template for the view)  
```
div
  h3 Sidebar Placeholder
```
_/sidebar/Sidebar.coffee_ (the viewModel for the view)  
```
class SidebarView extends Backbone.View
  template: require './sidebar.jade'
  el: '#sidebar-region'

module.exports = SidebarView
```
It is best to create individual folders for your Backbone.View and associated
.jade template pairs. All views must return factory/constructors. The `el` attribute
must reference the selector for layout region it will be rendered in.  The
`template` attribute must reference a template.jade file.  


Then *register* this view in the _index.coffee_ file in the same folder.

```
exports.sidebar = require './sidebar/Sidebar.coffee'
```
<a name="CreateRoute"></a>
## Creating a Route
To allow navigation, your router needs to know what to render in response to
changes in the URL.  

In _/src/app/routes/.._ create _homeWithSidebar.coffee_:  
```
homeWithSidebar = (params) ->
  viewManager.render {
    layout: 'hasSidebar'
    views: ['navigation','home','sidebar']
  }, params

module.exports = homeWithSidebar
```
This route expects two things.
1. In layouts/index.coffee there will be: `exports.hasSidebar = require './hasSidebar.jade'`
2. In views/index.coffee there will be: `exports.home = require './home/Home.coffee'`, and so on
for each view in the views array. This parameter can be a simple string if there is
only one view to render.  


Then *register* this route in the _index.coffee_ file in the same folder.
```
exports['home-with-sidebar'] = require './homeWithSidebar.coffee'
```

<a name="Links"></a>
## Linking to the route
Links correspond with the route exported in the index of the routes folder.
`exports['home-with-sidebar'] = -> ...` will create a route responsible for the
/#home-with-sidebar url.  


<a name="ExtendedViews"></a>
## The Extended Views
By default, all Backbone.Views are extended with default .render and .remove
functions that the viewManager calls on each appropriately. These are defined
in /src/fn/viewUtils.coffee

The code for rendering is as follows:
```
exports.render = (params) ->
  if @beforeRender? then @beforeRender()
  @setElement @region
  @$el.html @template()
  ko.cleanNode @el
  ko.applyBindings {params: params, view: this}, @el
  if @afterRender? then @afterRender()
```

This creates the following situation:
1. There is a beforeRender() and afterRender() hook, which is often useful.
2. ko.applyBindings is called to the view's region. The view itself is then used
as the viewModel. If params were passed to the view by the router, they are stored
in the `._params` key of the viewModel by default.
3. These views cannot be nested in each other (ko.applyBindings conflict).
Use Knockouts template and component capabilities for creating these nested structures.
Backbone is here to give a general structure to the application. Let Knockout handle
the finer granularity.  

There are also `beforeRemove` and `afterRemove` hooks respectively fired for the
remove function. This is useful for additional disposal logic and memory management.

<a name="ViewManager"></a>
## The ViewManager


<a name="Router"></a>
## The Router
