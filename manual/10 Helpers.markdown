<h1 id="section_10">10 Helpers</h1>

Helper methods are defined in one of two modules: Pakyow::Helpers or Pakyow::GeneralHelpers. GeneralHelpers only provide information and are used in the binders.

<h2 id="section_10.1">10.1 Params</h2>

Query string parameters and values from parameterized routes are available in the params hash:

<div class="code ruby">
request.params
</div>

<h2 id="section_10.2">10.2 Sessions &amp; Cookies</h2>

Sessions keep state across requests. They can be enabled by using any Rack session middleware:

<div class="code ruby">
middleware do
  use Rack::Session::Cookie
end
</div>

Sessions are then accessed through the request object:

<div class="code ruby">
request.session[:value] = 'foo'
</div>

Cookies can be set or fetched the same way:

<div class="code ruby">
request.cookies[:value] = 'foo'
</div>

By default a cookie is created for the path '/' and is set to expire in seven days. These defaults can be overridden when setting a cookie:

<div class="code ruby">
request.cookies[:value] = { 
  :value => 'foo',
  :expires => Time.now + 3600
}
</div>

<h2 id="section_10.3">10.3 Redirecting</h2>

Issuing a browser redirect is easy:

<div class="code ruby">
app.redirect_to! 'url'
</div>

The response status is set to 302 and the response is sent immediately.

You can also pass a status code to 'redirect_to':

<div class="code ruby">
app.redirect_to! 'url', 301  # permanent redirect
</div>

<h2 id="section_10.4">10.4 Sending Files</h2>

A file can be sent:

<div class="code ruby">
app.send_file!(file)
</div>

A file or path can be passed. You can also pass the file name
and the mime type (which is guessed if not passed).

<div class="code ruby">
app.send_file!(file, "xml_data.xml", "text/xml")
</div>

Data can also be sent:

<div class="code ruby">
app.send_data!(xml_data, "text/xml")
</div>

The file name can also be passed:

<div class="code ruby">
app.send_data!(xml_data, "text/xml", "xml_data.xml")
</div>

<h2 id="section_10.5">10.5 Request &amp; Response Objects</h2>

The underlying Rack Request & Response objects can be accessed through the 'request' and 'response' methods. This is useful for directly modifying things like response status.

In addition, the following things are available in the request:

### request.controller
The instance of the controller used in this request.

### request.action
The action called in this request.

### request.format
The format used in this request. This value defaults to HTML and is changed by adding an extension to the URL, for example:

    /foo.json

### request.error
The error that occurred during the request.

<h2 id="section_10.6">10.6 Logging</h2>

Write to the log using the static Log class:

<div class="code ruby">
Log.puts "Just saying hello to the log"
</div>

<h2 id="section_10.7">10.7 Interrupting Execution</h2>

### halt!
The execution of a route block or controller, a hook, or a handler can be stopped immediately and the current state of the response returned.

<div class="code ruby">
app.halt!
</div>

### invoke_handler!
The execution of a route block or controller, a hook, or a handler can be stopped immediately and control
transferred to a handler. See [Handlers](#section_6) for more information.

### invoke_route!
The execution of a route block or controller, a hook, or a handler can be stopped immediately and control
transferred to another block or controller.

<div class="code ruby">
app.invoke_route! '/some/route'
app.invoke_route! '/another/route', :get
</div>

The content returned will be the same as if this route was originally called from the client.
The optional second argument specifies the request method used to find the specified route.
If omitted, the request method that is currently be executed is used.
