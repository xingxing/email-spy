# -*- encoding: utf-8 -*-
require File.expand_path('../lib/email-spy/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'email-spy'
  s.version     = EmailSpy::VERSION
  s.date        = '2012-07-30'
  s.summary     = ""
  s.description = "Retrieves contact list of email"
  s.authors     = ["Wade Xing"]
  s.email       = ['iamxingxing@gmail.com']
  s.files         = `git ls-files`.split($\)
  
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})

  s.require_paths = ["lib"]

  s.homepage    = 'https://github.com/xingxing/email-spy'
end