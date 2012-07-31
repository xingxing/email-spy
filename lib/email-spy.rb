# -*- coding: utf-8 -*-
require 'rubygems'
require 'bundler/setup'
require "nokogiri"
require 'gdata'

require "mechanize"
require "csv"

require 'email-spy/contact'
require 'email-spy/version'
require 'email-spy/errors'
require 'email-spy/gmail'
require "email-spy/hotmail"

module EmailSpy
  # 获取 联系人集合
  # @param [String] 邀请人电邮地址
  # @param [String] 邀请人电邮密码
  # @param [String] 邮件类型
  # @param [Array<EmailSay::Contact>] 联系人集合
  def self.fetch invitor_email_address,invitor_email_password,email_type
    Gmail.fetch invitor_email_address,invitor_email_password
  end
end
