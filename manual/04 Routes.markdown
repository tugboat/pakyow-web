<h1 id="section_4">4 Routes</h1>

Routes define how requests are routed to the application's business logic. They are defined in the application's route block.

A route definition consists of an HTTP method and a route spec, which is matched against the request. Each route can be associated with a block:

<div class="code ruby">
get '/' {}
post '/' {}
put '/' {}
delete '/' {}
</div>

Or routed to a controller and action:

<div class="code ruby">
get '/', :MyController, :my_action
</div>

A route spec can also be a regular expression:

<div class="code ruby">
get /(.)*/ {}
</div>

Routes are matched in the order they are defined. Once a match occurs, the business logic for the route is invoked and the response returned.

Parameters can be defined in the route spec and are accessible in the app.params hash:

<div class="code ruby">
get 'foo/:id' do
  Log.enter "foo's id is #{app.params[:id]}"
end
</div>

<h2 id="section_4.1">4.1 Default Route</h2>

A default route can be defined:

<div class="code ruby">
default {} 
</div>

The default route can also be routed to a controller and action.

This is equivalent to:

<div class="code ruby">
get '/', {}
</div>

<h2 id="section_4.2">Restful Routes</h2>

A shortcut is provided for defining restful routes. The definition consists of a base route spec and a controller:

<div class="code ruby">
restful 'posts', :PostsController
</div>

This is identical to:

<div class="code ruby">
get 'posts', :PostsController, :index
get 'posts/:id', :PostsController, :show
get 'posts/new', :PostsController, :new
post 'posts', :PostsController, :create
get 'posts/edit/:id', :PostsController, :edit
put 'posts/:id', :PostsController, :update
delete 'posts/:id', :PostsController, :delete
</div>

A model can also be provided in the restful route definition:

<div class="code ruby">
restful 'posts', :PostsController, :Post
</div>

See [Binders - Form Action](#section_7.1) for more information.