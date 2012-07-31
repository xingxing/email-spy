# -*- coding: utf-8 -*-
module EmailSpy
  class Hotmail
    # 登录页 地址
    Landing_Page_URL = 'https://login.live.com/login.srf?id=2'

    # 用户名密码错误提示
    Login_Error_Message = "That password is incorrect. Be sure you're using the password for your Microsoft account."

    Contacts_API_URL = "http://co108w.col108.mail.live.com/mail/GetContacts.aspx"

    def self.fetch invitor_email_address,invitor_email_password
      agent = Mechanize.new
      agent.verify_mode=OpenSSL::SSL::VERIFY_NONE
      page = agent.get(LANDING_PAGE_URL)
      login_form = page.forms[0]
      form.login ,form.passwd = invitor_email_address,invitor_email_password
      page = form.submit
      raise AuthorizationError if page.include? Login_Error_Message
      body = agent.get(Contacts_API_URL).body
      
      # CSV.parse(body,headers: :first_row).map do |record|
      #   Content.new("#{record['First Name']} #{record['Last Name']}",record['E-mail Address'])
      # end
    end
  end
end
