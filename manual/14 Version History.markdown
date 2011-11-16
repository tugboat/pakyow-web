<h1 id="section_14">14 Version History</h1>

- 0.7 (November 19, 2011)
  - TODO

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
