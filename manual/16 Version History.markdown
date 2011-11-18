<h1 id="section_16">16 Version History</h1>

- 0.7 (November 19, 2011)
  - The core-presenter interface has been modified slightly.
  - Added bang (!) to application methods that interrupt flow.
  - Binding now supports hashes with the :to syntax.
  - Binders are now binders for the data label instead of object type (e.g. binder_for :blog_post instead of binder_for :BlogPost).
  - Current attribute value can be modified with procs.
  - Routes and Handlers can now be invoked (with invoke_route! and invoke_handler!).
  - Hooks (before/after/around) can be defined for routes.
  - Fully constructed views are cached for each path (significant performance boost).
  - The logger, reloader, and static file handler has been abstracted into Rack Middleware.
  - Pakyow Mailer is now available to send views in an email message.
  - pakyow console script now available.
  - Root view override in index directories no longer specify a root view for siblings.
  - Fix regex route error (was removing route vars).
  - App file is no longer loaded twice upon initialization.
  - Fix cookie creation when cookie is a non-nil value but not a String.
  - Fix problem binding to a checkbox who’s value attribute is not set.

- 0.6.3 (September 13, 2011): 
  - Routing performance has been improved.
  - Several load path issues have been fixed.
  - Gems can now be built and used from anywhere.
  - An inconsistency has been fixed with request.params have both string and symbol keys.
  - Staging an application now loads middleware defined by the application. This simplifies the Rackup file.
  - Binding now works when binding to a binding defined by the HTML 'name' attribute.

- 0.6.2 (August 30, 2011): 
  - JRuby is now supported!
  - Can now run 'pakyow server' on Windows. Sorry for the delay guys.
  - Error handlers now have access to Helpers. Also fixes some issues presenting views from error handlers.
  - Binding an object to a root node now works as one would expect.
  - Fixes an issue when using alphanumeric ids in restful routes.
  
- 0.6.1 (August 22, 2011): 
  - Fixes gemspec issue (stupid, sorry).
  
- 0.6.0 (August 22, 2011): 
  - Initial public release.
