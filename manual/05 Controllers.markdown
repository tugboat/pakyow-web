<h1 id="section_5">5 Controllers</h1>

In Pakyow, controllers are optional but recommended for an app of any substantial size. When a request is matched, it is routed to a controller and an action (unless a block is defined for the route; see [Routes](#section_4) for more information).

A controller is a class, an action is a method defined in the class. For example:

<div class="code ruby">
class MyController
  def my_action
  end
end
</div>

There are several convenience methods (such as 'request', 'response', and 'presenter') that you will probably want easy access to from your controller. Just include 'Pakyow::Helpers' into your class (see [Helpers](#section_8) for more information).