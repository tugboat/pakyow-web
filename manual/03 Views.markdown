<h1 id="section_3">3 Views</h1>

In Pakyow, views define what the application will present. They are 100% HTML and no template language or special tags are needed to construct the view layer.

View construction begins with a root view, which usually defines the general view structure. Containers are created in the root view, which define the parts of the structure that are generated dynamically. Creating a container is as easy as adding an "id" attribute to any tag. For example, this is a container named "main":

    <div id="main"></div>

Pakyow will look for content for this container in a content view named "main.html". Any number of containers can be defined in any view (root views or content views). 

Views are defined in a folder hierarchy and are pieced together based on the URL. Say we have the following files in the views directory:

    pakyow.html (the default root view; defines one content area named "main")
    index/
      main.html
    another_page/
      main.html

When a request is made for '/' (or '/index') the content view in the 'index' directory will be used. Same for 'another_page'. This hierarchy can be as deep as needed.

In most cases the view path matches the URL exactly. However there are some exceptions when dealing with routes that define parameters (e.g. 'foo/:bar') and restful routes.

Parameterized routes are collapsed down when determining the view path. For example, the view path for 'foo/:bar' is simply 'foo'. This rule also applies to restful routes, and there is one more rule for the 'show' route. If  restful routes are defined for 'posts', the show route would be 'posts/:id'. Instead of the view path collapsing down to 'posts', it becomes 'posts/show'.

Views can be overridden at any location in the hierarchy. Let's add to our view hierarchy described above:

    pakyow.html
    index/
      main.html
    another_page/
      main.html
      yet_another_page/
        main.html

Requests for 'index' and 'another_page' work as before. When a request is made for 'another_page/yet_another_page' only the main.html content view in the 'yet_another_page' directory will be used. Root views can also be overridden this way.

Since any number of root views can exist, it is necessary to define which root view to use at any given level in the view hierarchy. This can be done by appending '.root_view_name' to the end of a directory. For example:

    another_root.html
    pakyow.html
    index/
      main.html
    another_page.another_root/
      main.html

In this case requests for '/another_page' will use the 'another_root.html' root view. Changing the root view on a directory also changes it for directories further down the hierarchy.

<h2 id="section_3.1">3.1 Data Informed</h2>

Views are informed of the data they present. This is accomplished with the itemprop attribute. Let's say we have some HTML that represents a contact:

    <div class="contact">
      <span itemprop="contact[full_name]">John Doe</span>
      <a itemprop="contact[email]">johndoe@gmail.com</a>
    </div>

In this example the view represents two pieces of data from the Contact model: full_name and email.

Form fields can be informed using the "name" attribute. The following are identical:

    <input type="text name="contact[full_name]">
    <input type="text itemprop="contact[full_name]">

See [View Logic > Binding](#section_6.3) for more information on how objects are bound to views.

<h2 id="section_3.2">3.2 AJAX & Partial Content</h2>

It's often necessary to request content only for part of a view (say for replacing content via AJAX). This is easy in Pakyow. Just set the '_container' parameter in your AJAX request to the container you want content for. The response body will consist of only the content for the container requested.