<h1 id="section_7">7 Controllers</h1>

In Pakyow, controllers are optional but are often helpful for large applications. When a request is matched, it is routed to a controller and an action (unless a block is defined for the route; see [Routes](#section_4) for more information).

A controller is a class, an action is a method defined in the class. For example:

<div class="code ruby">
class MyController
  def my_action
  end
end
</div>

There are several convenience methods (such as 'app', 'request', 'response', and 'presenter') that you will probably want easy access to from your controller. Just include 'Pakyow::Helpers' into your class (see [Helpers](#section_10) for more information).
