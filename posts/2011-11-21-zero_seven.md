---
title: 0.7 Release
time: 6:45am CST
---

We're proud to announce Pakyow 0.7.0, available now. It's been a little over two months since the release of 0.6.3 and a lot of work has gone into this release. A lot of consistency has been added to the framework which will allow us to focus the explanation and the message of letting code be code, views be views, and data be data. This release also adds to the sturdiness of the platform, one we will continue to build on in future releases.

The details of each addition and change can be found below. We have also done our best to explain the philosophy and thought behind each feature. In an effort to make the conversations more public, we have decided to make better use of our mailing list. We would love your input as we start discussing core features for the next major release. If you would like to be a part of this discussion please [join the mailing list](http://groups.google.com/group/pakyow).

And now, the details.

## Core-Presenter Interface

Pakyow has been divided into two gems from the beginning: pakyow-core (handles routing a business logic) and pakyow-presenter (handles view construction, manipulation, and data binding). There is an interface through which the two gems communicate, which is clarified in 0.7. We've added documentation on this interface which will give you everything you need to know to build a custom presenter. 

[Read more about the interface &rarr;](/manual#section_14).

## Application Bang (!) Methods

Any method that halts the request/response life cycle is now a bang method. Here's a complete list (all defined in the Application class):

- halt!
- send_file!
- send_data!
- redirect_to!
- invoke_route!
- invoke_handler!

Two methods (invoke_route! and invoke_handler!) are new in 0.7.

## Performance Improvements

Significant performance improvements have been made to pakyow-core and pakyow-presenter. Based on our benchmarking, an application that uses pakyow-core only went from handling 1,500 requests per second to 2,400 requests per second (a 60% increase). An application that uses pakyow-presenter to present a simple view went from handling 600 to 1,500 requests per second (a 150% increase). Here's how we did it.

Performance in pakyow-core was improved by introducing three pieces of middleware: Static, Logger, and Reloader. In production settings, when static files are handled by a web server, loggers aren't needed, and the application doesn't need to be reloaded, this middleware can simply be turned off, resulting in the increase you see above.

For pakyow-presenter, we made a simple change to how view caching works. In 0.6.*, each view file was cached in memory and view construction still happened on each request. With the changes we've made, Pakyow now caches all fully constructed views. So, with view_caching turned on all view construction happens when the application starts and never during the request/response life cycle.

## Binding Changes

Some subtle, but important changes have been made to how binding works. In previous versions, the importance was placed on the data type being bound to the view. That's no longer the case. Instead, emphasis is placed on the data label declared in the view. This means that any object (or hash) can be bound to any label. Here's an example, starting with the view:

    html:
    <div>
      <span itemprop="person[name]">John Doe</span>
      <span itemprop="person[email]">johnd@pakyow.com</span>
    </div>

Binding a Person object:

    ruby:
    view.bind(Person.new({:name => "Matz", :email => "matz@ruby-lang.org"}))

In this case, the data label is inferred from the object type and is matched to 'person'. We can also bind a hash, using the new :to syntax:

    ruby:
    view.bind({:name => "Matz", :email => "matz@ruby-lang.org"}, :to => :person)

The :to syntax will work with any object:

    ruby:
    view.bind(SpecificPerson.new({ :name => "Matz", :email => "matz@ruby-lang.org"}), :to => :person)

Each of these will result in the following HTML:

    html:
    <div>
      <span itemprop="person[name]">Matz</span>
      <span itemprop="person[email]">matz@ruby-lang.org</span>
    </div>

[Read more about Data Binding &rarr;](/manual#section_8.3)

This also led to a subtle change in how Binders are declared. In 0.6.*, a binder was declared for an object type:

    ruby:
    class PersonBinder < Pakyow::Presenter::Binder
      binder_for :Person
    end

In 0.7, the binder is declared for a data label:

    ruby:
    class PersonBinder < Pakyow::Presenter::Binder
      binder_for :person
    end

This allows a binder to be used when binding any object or hash to a particular label in the view.

[Read more about Binders &rarr;](/manual#section_9)

## Modifying Attribute Values

In previous versions, you could only replace attribute values. We've added a way to make changes to the current values using procs. Here's an example:

    ruby:
    view.find('#container').attributes.class = lambda { |cur_val| 
      # do something to cur_val 
    }

[Read more about View Manipulation &rarr;](/manual#section_8.1)

## Invoke Route / Handler

Any route or handler can be invoked using the new invoke_route! and invoke_handler! methods. This means that business logic for a different route can be used without issuing a redirect or making another request.

[Read more about Route / Handler Invocation &rarr;](/manual#section_10.7)

## Hooks

We've added the support for defining before, after, and around hooks. These hooks are defined on the routes themselves.

[Read more about Hooks &rarr;](/manual#section_5)

## Mailer

A new gem, pakyow-mailer, has been added that allows for mail to be sent easily from Pakyow. Just like a view can be constructed and presented in the browser, it can be be sent as an email. Everything available to views (manipulation, data binding, etc) is available to Mailer.

[Read more about Mailer &rarr;](/manual#section_13)

## Console

This is an addition to the Pakyow CLI and allows you to easily start an IRB session and interact with your application. Learn more with the following command:

    console:
    pakyow console --help

## Bug Fixes

Several bug fixes are included in this release:

- Root view override in index directories no longer specify a root view for siblings.
- Fix regex route error (was removing route vars).
- App file is no longer loaded twice upon initialization.
- Fix cookie creation when cookie is a non-nil value but not a String.
- Fix problem binding to a checkbox who’s value attribute is not set.

## Discussion

If you have any comments on this post please join the conversation on our [mailing list](https://groups.google.com/forum/#!topic/pakyow/B2JS8vOzR9Q). Bug reports should be submitted to our [GitHub Repo](https://github.com/metabahn/pakyow/issues).