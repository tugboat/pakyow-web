<h1 id="section_8">8 View Logic</h1>

Pakyow provides several ways for the business logic of an application to easily interact with the views. In most frameworks the view logic is contained in the view itself, but Pakyow separates views and view logic. This keeps the roles for design and developer clearly defined and reduces annoyances.

View construction happens before the business logic is invoked. The business logic can then manipulate the constructed view. Anything that is possible in a template language is possible with Pakyow.

<h2 id="section_8.1">8.1 View Manipulation</h2>

The fully constructed view can be accessed like this:

<div class="code ruby">
presenter.view
</div>

Parts of the view can be accessed with the 'find' method. The 'find' method accepts a CSS selector and returns a collection of views that match the selector.

<div class="code ruby">
presenter.view.find('#container')
</div>

Several methods are available to modify a view (or collection of views). When a method is called on a view collection, it is simply passed through to the views in the collection. If the method returns a value when called on a single view, calling it on a collection of views will return an array of values.

### Content

Content can be set and fetched:

<div class="code ruby">
presenter.view.find('#container').content = 'foo'
presenter.view.find('#container').content
</div>

It can also be appended:

<div class="code ruby">
presenter.view.find('#container').append('bar')
</div>

Or:

<div class="code ruby">
presenter.view.find('#container').content &lt;&lt; 'bar'
</div>

Views can be turned into a string of HTML:

<div class="code ruby">
presenter.view.find('#container').to_html
</div>

### Attributes

Attributes can be set or fetched:

<div class="code ruby">
presenter.view.find('#container').attributes.class = 'classname'
presenter.view.find('#container').attributes.class
</div>

Any HTML attribute can be set or fetched in this way. Current attribute values can be modified
using procs. The current value is provided to the block and the return value is used as the
new value.

<div class="code ruby">
presenter.view.find('#container').attributes.class = lambda { |cur_val| 
  # do something to cur_val 
}
</div>

### Removing &amp; Clearing Views

A view can be removed:

<div class="code ruby">
presenter.view.find('#container').remove
</div>

Or have it's content cleared:

<div class="code ruby">
presenter.view.find('#container').clear
</div>

<h2 id="section_8.2">8.2 View Contexts</h2>

Pakyow provides an easy way to group actions performed on a single view (or view collection) into contexts. There are two ways to do this. The first is specific to containers:

<div class="code ruby">
with_container :main { ... }
</div>

The second approach can be used on any view:

<div class="code ruby">
presenter.view.find('#container').in_context { ... }
</div>

Inside the block, the view can be accessed through the 'context' method.

<div class="code ruby">
with_container :main do
  context.content = 'foo'
end
</div>

The makes it really easy to group manipulations together to more easily comprehend what's happening.

<h2 id="section_8.3">8.3 Binding</h2>

Data can easily be bound to a view (for more information on how the view is informed of the data it represents, see [Views > Data Informed](#section_3.2)). Given the following view:

    <div class="contact">
      <span itemprop="contact[full_name]">John Doe</span>
      <a itemprop="contact[email]">johndoe@gmail.com</a>
    </div>

We can bind a Contact object to it:

<div class="code ruby">
view.bind(Contact.new(:full_name => "Matz", :email => "matz@ruby-lang.org"))
</div>

In this case, the data type is inferred from the object type (Contact becomes contact and FooBar becomes foo_bar). Objects and 
hashes can also be bound to any label:

<div class="code ruby">
data = {:full_name => "Matz", :email => "matz@ruby-lang.org"}
view.bind(data, :to => :contact)
</div>

<h2 id="section_8.4">8.4 Repeating Views</h2>

A common task in application development is repeating a view for a data collection. Pakyow makes this easy:

<div class="code ruby">
presenter.view.find('.contact').repeat_for(contacts)
</div>

In this case, the view will be repeated once for each object in the array of contacts. In addition, each contact will be bound to its view automatically.

<h2 id="section_8.5">8.5 Custom Views</h2>

A custom view class can be created and used in cases where view logic is repeated across controllers. The view class can be tied to a specific view file.

<div class="code ruby">
class MyView &lt; Pakyow::Presenter::View
  view_path 'path/to/default_view.html'
end
</div>

The default view file can be overridden by passing a path to the initializer.

<div class="code ruby">
MyView.new('path/to/another_view.html')
</div>

<h2 id="section_8.6">8.6 Changing the View Path or Root View</h2>

The view path can be changed at any point, causing the presentation layer to be rebuilt:

<div class="code ruby">
presenter.use_view_path('path/to/views')
</div>

A root view can also be changed, again causing the presentation layer to be rebuilt:

<div class="code ruby">
presenter.set_view('path/to/root_view.html')
</div>

<h2 id="section_8.7">8.7 Page Titles</h2>

The title for a page can easily be set, changed, or fetched:

<div class="code ruby">
presenter.view.title = 'My Page Title'
presenter.view.title
</div>
