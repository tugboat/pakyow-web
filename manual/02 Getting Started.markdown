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
The business logic lives here. No structure is forced, all files with a .rb extension are loaded at runtime. 
TODO: make a note that this is configurable.

### app/views
Where the views live. 
TODO: expand on this and possibly link to view section

### config
All configuration files live here. Upon app generation it contains a single file, application.rb. This file contains the application class and defines the routes, configuration, and error handlers for the application.
TODO: this isn't really a place for configurations, but for application files

### logs
Contains the log file for the application (requests.log by default). 
TODO: rename default to log?

### public
The document root. Anything placed here can be accessed directly through the URL.
TODO: give an example (images, css, js, etc)
