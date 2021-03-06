<h1 id="section_9">9 Binders</h1>

When binding data to a view it's often necessary to format the data before binding. Sometimes you also 
need to change other attributes in addition to setting content (e.g. setting the 'href' for an anchor 
tag). In Pakyow this logic lives in a Binder class. A Binder is a collection of functions that act
on the data as it's being presented.

<div class="code ruby">
class ContactBinder &lt; Pakyow::Presenter::Binder
  binder_for :contact

  def full_name
    "#{bindable.first_name} #{bindable.last_name}"
  end

  def email
    { 
      :content => bindable.email,
      :href => "mailto:#{bindable.email}"
    }
  end
end
</div>

The 'binder_for' method informs Pakyow what data type this Binder should bind data to. In the above example,
the binder will be used when binding any data to a view labeled as 'contact'. When the object is bound 
to a view Pakyow looks for a method that matches the attribute in the binder before looking in the object.

The object being bound is accessible through the 'bindable' method. The method's return value determines the behavior of the binding process. If the return value is a hash it is mapped to content and/or attribtues for the view. Otherwise the value is converted into a string at used as the content for the view.

Attributes and content can be modified using procs. The current value is provided to the block and the return value is used as the new value.

<div class="code ruby">
{
  :content => lambda {|current_content| current_content.gsub('foo', 'bar')}
}
</div>

Methods defined in the Pakyow::GeneralHelpers module are automatically available in the Binder class (request/response).

<h2 id="section_9.1">9.1 Form Actions</h2>

Pakyow makes it easy to change the action and method for a form based on the state of the object. Note this will only work if a Binder exists for the object being bound *and* restful routes exist for the object type (see [Routes](#section_4)). 

Here's an example for the Contact object:

    <form itemprop="contact[action]">…</form>

To determine state, Pakyow examines the 'id' attribute of the object. In most ORMs (such as Datamapper and ActiveRecord) the 'id' is mapped to the object's primary key in the database. 

If 'id' has no value the object is assumed to be a new object, so the form will submit to the object's restful route for 'create'.

If 'id' has a value Pakyow assumes the object has been created and will be updated, thus resulting in configuring the form to submit to the object's restful route for 'update'.

<h2 id="section_9.2">9.2 Dropdowns</h2>

When binding to a dropdown, Pakyow will automatically select the option that matches the value for the attribute. Options for the dropdown can be defined in a binder:

<div class="code ruby">
class MyBinder &lt; Pakyow::Presenter::Binder
  binder_for :MyModel
  options_for :attribute, [['1', 'Option 1'], ['2', 'Option 2']]

  def attribute
    1
  end
end
</div>

The options will automatically be created when binding to the 
dropdown. Here's an example:

    <select name="my_model[attribute]">
      <option value="1" selected>Option 1</option>
      <option value="2">Option 2</option>
    </select>

Options can also be specified in a method, which is useful when the options will be created dynamically.

<div class="code ruby">
options_for :attribute, :attribute_options

def attribute_options
  [['1', 'Option 1'], ['2', 'Option 2']]
end
</div>

<h2 id="section_9.3">9.3 Checkboxes &amp; Radio Buttons</h2>

The checkbox or radio button who's value matches the value of the attribute is selected automatically.
