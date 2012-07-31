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

  s.add_runtime_dependency "httpclient", "~> 2.2.5"
  s.add_runtime_dependency 'nokogiri',"~> 1.5.0"
  s.add_runtime_dependency 'gmail_contacts', "~> 2.0"
  s.add_runtime_dependency 'rspec', "~> 2.11.0"
  s.add_runtime_dependency 'gdata_19',"~> 1.1.5"
end
