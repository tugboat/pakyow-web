<h1 id="section_12">12 Configuring Pakyow</h1>

TODO: add middleware settings (others?)

All configuration is defined in the Application class. If auto_reload is set to "true", the configuration will be reloaded on each request (perfect for development). Otherwise the configuration will be loaded once at runtime.

Configuration can be defined for the entire app:

<div class="code ruby">
config.app.log = true
config.app.default_environment = :development
</div>

Or for a single environment:

<div class="code ruby">
configure :development do
  app.dev_mode = true
end
</div>

<h2 id="section_12.1">12.1 Configuration Settings</h2>

Configuration settings are broken into three groups: app, presenter, and server.

### app.application_path
The path to the file where the application class is defined. This is set automatically and shouldn't be changed.

### app.auto_reload
Reloads the application class and all files in "src_dir" on every request.

Defaults to 'true'.

### app.default_action
The default action to call when routing to a controller.

Defaults to 'index'.

### app.default_environment
The default environment to run the application in.

Defaults to 'development'.

### app.dev_mode
Issues warnings instead of breaking certain things. Currently only used by pakyow-presenter to keep the application from breaking when binding an object to a view when the attribute isn't defined on the object being bound.

Defaults to 'true'.

### app.errors_in_browser
Displays any errors in the browser (useful for development).

Defaults to 'true'.

### app.ignore_routes
Keeps the backend from being used (useful when working with views).

Defaults to 'false'.

### app.log
Write logs to a log file, and to STDOUT.

Defaults to 'true'.

### app.log_dir
Where the logs live.

Defaults to '{root}/logs'.

### app.log_name
What the log file should be named.

Defaults to 'requests.log'.

### app.presenter
Sets the presenter to be used. This is set automatically when a presenter is included and shouldn't be changed.

### app.public_dir
The folder where static files live (CSS, Javascript, images, etc).

Defaults to '{root}/public'.

### app.root
The root directory of the application.

Defaults to where the application is started from.

### app.src_dir
Where the backend code lives.

Defaults to '{root}/app/lib'.

### presenter.default_root_view_name
The default root view to use.

Defaults to 'pakyow.html'.

### presenter.javascripts
Where the Javascript files live (used when adding/removing resources to a view).

Defaults to '{public_dir}/javascripts'.

### presenter.stylesheets
Where the CSS stylesheets live (used when adding/removing resources to a view).

Defaults to '{public_dir}/stylesheets'.

### presenter.view_caching
If views are cached, they are loaded only once at runtime. Otherwise they are loaded on every request, so changes are picked up (useful for development).

Defaults to 'false'.

### presenter.view_dir
Where the views live.

Defaults to '{root}/app/views'.

### server.host
What host to run the application on (only used when running the application with the built-in server).

Defaults to '0.0.0.0'.

### server.port
What port to run the application on (only used when running the application with the built-in server).

Defaults to '3000'.
