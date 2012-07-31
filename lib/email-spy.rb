require 'rubygems'
require 'bundler/setup'
require "nokogiri"
require "gdata"

require 'email-spy/contact'
require 'email-spy/version'
require 'email-spy/errors'
require 'email-spy/gmail'

module EmailSpy
  def self.fetch invitor_email_address,invitor_email_password,email_type
    Gmail.fetch invitor_email_address,invitor_email_password
  end
end
