email-spy
=========



```ruby
contacts = EmailSpy.fetch(account, password, type)
contacts.each do |contact|
  puts "name: #{contact.name}, email: #{contact.email}"
end
```