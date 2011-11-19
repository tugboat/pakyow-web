<h1 id="section_13">13 Mailer</h1>

Pakyow has a separate library, pakyow-mailer, for sending mail. It's built on the <a href="https://github.com/mikel/mail">mail</a>
gem and adds the ability for views to be delivered through email. Here's an example:

<div class="code ruby">
Pakyow::Mailer.new(view_path).deliver_to("test@pakyow.com")  # also accepts an array
</div>

The view will be constructed just like it would be if it was being presented in a 
browser. Access to the view is available for manipulation and binding:

<div class="code ruby">
mailer = Pakyow::Mailer.new(view_path)
mailer.view.bind(some_data)
mailer.deliver_to("test@pakyow.com")
</div>

Access to the message object is also available:

<div class="code ruby">
mailer = Pakyow::Mailer.new(view_path)
mailer.message.add_file("/path/to/file.jpg")
mailer.deliver_to("test@pakyow.com")
</div>

There are several configuration settings for Mailer. See <a href="/manual#section_12.1">Configuration Settings</a> for more information.
