<h1 id="section_11">11 Error Handling</h1>

TODO: update section based on changes

Error handlers can be defined for 500 and 404 errors. These handlers are created in the same context as the routes and configuration. Like routes, errors can be a controller and action, or a block.

<div class="code ruby">
error 500, :ErrorHandlingController, :handle_500
error 404 { # handle 404 }
</div>

The handler for a 500 error is invoked when an exception is raised in the backend code. A 404 error is generated when the request doesn't match a route, a view path, or a static file.
