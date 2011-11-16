<h1 id="section_11">11 Error Handling</h1>

 See the section on [Handlers](#section_6) for how to define a handler that has an associated response status.

If the request doesn't match a route, a view path, or a static file then a 404 response status is set.
If a handler is defined with a 404 status then the handler is invoked.

If an exception is raised in the backend code then a 500 response status is set and a 500 status handler is invoked if one is defined.
