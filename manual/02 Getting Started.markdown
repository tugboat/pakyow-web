<h1 id="section_2">2 Getting Started</h1>

Pakyow includes an application generator to make it easy to get started.

<code class="console">
  pakyow new application
</code>

Then start the server:

<code class="console">
  cd application
  <br>
  $ pakyow server
</code>

<h2 id="section_2.1">2.1 Architecture</h2>

Pakyow follows the MVC design pattern, but the flow is a bit different than 
what you might be used to. When a request is received the views are assembled
first (based on the URL). If a route matches the appropriate business logic
is invoked. The business logic can then manipulate the view and bind data to it.

TODO: This should be more of a comparison.

<h2 id="section_2.2">2.2 Application Structure</h2>

### app/lib
This directory contains Ruby source files that define an application's business 
logic. No structure is forced, all files with a .rb extension are loaded at 
runtime by default. This behavior is configurable via the 'app.auto_reload' 
configuration setting.

### app/views
All of the views for an application are contained in this directory. For more
information about views and view structure, see [Views](#section_3).

### config
Upon app generation this directory contains a single file, application.rb, which
contains the application class and defines the routes, configuration, and error 
handlers for the application.

### logs
Contains the log file for the application (requests.log by default). 
TODO: what is trying to be said in the parenthesis? rename default to log?

### public
Any file placed in this directory can be accessed directly through the URL
(images, stylesheets, javascripts, etc).
