# -*- coding: utf-8 -*-
module EmailSpy
  class Hotmail
    # 登录页 地址
    LANDING_PAGE_URL = 'https://login.live.com/login.srf?id=2'

    # 用户名密码错误提示
    Login_Error_Message = "That password is incorrect. Be sure you're using the password for your Microsoft account."

    Contacts_API_URL = "http://co108w.col108.mail.live.com/mail/GetContacts.aspx"

    def self.fetch invitor_email_address,invitor_email_password
      agent = Mechanize.new
      agent.verify_mode=OpenSSL::SSL::VERIFY_NONE
      page = agent.get(LANDING_PAGE_URL)
      login_form = page.forms[0]
      login_form.login ,login_form.passwd = invitor_email_address,invitor_email_password
      page = login_form.submit
      raise AuthorizationError if page.body.include? Login_Error_Message
      body = agent.get(Contacts_API_URL).body
      
      contacts = []

      CSV.parse(body,headers: :first_row).each do |record|
        contacts << Contact.new("#{record['Last Name']} #{record['First Name']}",record['E-mail Address'])
      end
      
      contacts.compact
    end
  end

  private
  
  EMAIL_TYPE['hotmail'] = "Hotmail"
end
