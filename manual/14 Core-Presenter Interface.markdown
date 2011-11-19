<h1 id="section_14">14 Core-Presenter Interface</h1>

A Pakyow Core interacts with Pakyow Presenter through 5 presenter methods.

### initialize
When core initializes, the presenter instance is created which calls its initialize method.
This happens at startup and is called once.

### load
When the application loads, or reloads, the load method of the presenter is called

### prepare_for_request
This is called for each request before any code is executed for the route. This allows the presenter to do whatever
is necessary to be ready to present content for the request.

### content
This is called after any code for the route is executed.
The application uses the return value of this method for the response body.

### presented?
This method is called to determine if the presenter actually presented anything.
The application uses the return value as part of determining whether to respond with a 404.
