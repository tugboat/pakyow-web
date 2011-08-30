<h1 id="section_8">8 Helpers</h1>

Helper methods are defined in one of two modules: Pakyow::Helpers or Pakyow::GeneralHelpers. GeneralHelpers only provide information and are used in the Binder classes.

<h2 id="section_8.1">8.1 Params</h2>

Query string parameters and values from parameterized routes are available in the params hash:

<div class="code ruby">
request.params
</div>

<h2 id="section_8.2">8.2 Sessions & Cookies</h2>

Sessions keep state across requests. They can be enabled by using any Rack session middleware:

<div class="code ruby">
middleware do
  use Rack::Session::Cookie
end
</div>

They are accessed through the request:

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

<h2 id="section_8.3">8.3 Redirecting</h2>

Issuing a browser redirect is easy:

<div class="code ruby">
app.redirect_to 'url'
</div>

The response status is set to 302 by default and the response is sent immediately after this call is made.

You can also pass a status code to 'redirect_to' (e.g. 301 for permenent redirect).

<h2 id="section_8.4">8.4 Sending Files</h2>

A file can be sent:

<div class="code ruby">
app.send_file(file)
</div>

A file or path can be passed. You can also pass the name the file will be sent as
and the mime type (which is guessed if not passed).

Data can also be sent:

<div class="code ruby">
app.send_data(data, mime_type)
</div>

The name the file will be sent as can also be passed.

<h2 id="section_8.5">8.5 Request & Response Objects</h2>

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

<h2 id="section_8.6">8.6 Logging</h2>

Write to the log using the static Log class:

<div class="code ruby">
Log.puts "Just saying hello to the log"
</div>
