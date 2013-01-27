# premailer-rails3

I'm sick with premailer-rails3 bugs so I make this fork which
change the approach. Instead of trying to inject into ActionMailer
delivery, it simply provide ActionMailer with a helper named
inline_css(template_name) so you can do something like:

```
class MyMailer < ActionMailer::Base
  def reminder
    mail(to: 'user@email.com', subject: "Hello World with inline CSS")
    do |format|
      format.html { inline_css("reminder") }
    end
  end
end
```

The `inline_css` helper do all the hard work: parse the content,
extract css link and do the sprockets stuff. Kudos to all this
hardwork goes to the original author fphilipe.

As far as I can see, this approach free me from the attachment
headaches (https://github.com/fphilipe/premailer-rails3/issues/21) and
the rspec headache (in which rspec won't see email content so it
cannot verify)

Use it at your own risk :)

99.9% of the code is from premailer-rails3 so please refer to the
original repo https://github.com/fphilipe/premailer-rails3 for
details document. The only different is how you include it's in
Gemfile :)
```
  gem 'premailer-rails3', github: 'phuongnd08/premailer-rails3'
```
