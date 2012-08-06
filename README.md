email-spy
=========


Usage
-----

```ruby
contacts = EmailSpy.fetch(account, password, emailtype)
contacts.each do |contact|
  puts "name: #{contact.name}, email: #{contact.email}"
end
```

Current Supported Email Type
--------------------------

+ gmail
+ hotmail
+ 126
+ yahoo