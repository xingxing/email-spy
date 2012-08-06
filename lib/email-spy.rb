# -*- coding: utf-8 -*-
require 'rubygems'
require 'bundler/setup'
require "nokogiri"
require 'gdata'

require 'iconv'
require "mechanize"
require "csv"
require "json"

require 'email-spy/contact'
require 'email-spy/email_types'
require 'email-spy/version'
require 'email-spy/errors'

require 'email-spy/gmail'
require "email-spy/hotmail"
require "email-spy/126"
require "email-spy/yahoo"

module EmailSpy
  # 获取 联系人集合
  # @param [String] 邀请人电邮地址
  # @param [String] 邀请人电邮密码
  # @param [String] 邮件类型
  # @return [Array<EmailSay::Contact>] 联系人集合
  def self.fetch invitor_email_address,invitor_email_password,email_type
    self.const_get(operating_klass_name email_type).fetch invitor_email_address,invitor_email_password
  end

  private

  def self.operating_klass_name email_type
    key = email_type.to_s.downcase
    EMAIL_TYPE[key] or raise EmailTypeNotFound
  end
end
