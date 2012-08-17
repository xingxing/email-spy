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
+ 163
+ yahoo


Encoding
--------

我们尚未对联系人姓名编码进行什么处理,应为我们觉得这会使Email Spy不够纯粹:它只返回web server响应的内容。也许之后会支持?:alien:

我们推荐 rCharDet19(https://github.com/oleander/rchardet) 来帮助你解决编码的问题:

```ruby
EmailSpy.fetch(account,password,emailtype).map do |c| 
 c.name.encode('utf-8',CharDet.detect(c.name).encoding)
end
```

Change Log
----------

+ 0.0.3 first release
