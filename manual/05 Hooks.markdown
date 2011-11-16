<h1 id="section_5">5 Hooks</h1>

Hooks are code blocks that can run before, after, and around the code of a route.
They are defined in the 'routes' block of application.rb along with routes.

A hook is defined with a name and either a code block or a controller and action.

<div class="code ruby">
hook :auth {}
hook :begin, :WorkflowController, :enter
</div>

Hooks are attached to routes by adding a hash argument to the route definition.
The hash keys can be any of the symbols :before, :after, and :around.
The hash values are the name(s) of the hooks to call at a time relative to the route that is specified by the key.

<div class="code ruby">
get 'some/route', :before => [:auth, :begin], :after => :other_hook {}
</div>

The hash values can either be a single hook name or an array of hook names.
If an array, all hooks will be called in the array order at the specified time.

A hook can also be provided in the restful route definition:

<div class="code ruby">
restful 'posts', :PostsController, :before => :auth, :around => :posts_hook
</div>

In above case, the :auth hook will run before, and the :posts_hook hook with run both before and after,
the code of all of the restful 'posts' routes.
