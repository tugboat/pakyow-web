<h1 id="section_6">6 Handlers</h1>

Handlers are named code blocks that can be invoked either explicitly or implicitly.

They are defined within a 'handlers' block in application.rb.

A handler is defined with a name and an optional response status.

<div class="code ruby">
handlers do
    handler :not_found, 404 {}
    handler :error, 500, :ErrorController, :handle_500
    handler :other_handler, :OtherController, :do_other_thing
end
</div>

A handler is invoked explicitly by calling 'invoke_handler!(name)' from a route block or controller, hook, or another handler.

<div class="code ruby">
invoke_handler!(:not_found)
</div>

When invoked, current execution is stopped and control is transferred to the handler.
If the handler is defined with a response status, the response is set accordingly.

A handler may also be invoked with a status code argument.
<div class="code ruby">
invoke_handler!(500)
</div>

In this case, a handler is executed if there is one with a corresponding response status.
In any case, the response status is set to the status argument.

TODO: I don't think the following got implemented this way. Is this what we want?

A handler is implicitly invoked if defined with a response status and that status is what is set during the route block.


