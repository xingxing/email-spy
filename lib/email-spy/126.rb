# -*- coding: utf-8 -*-
module EmailSpy
  class OneTowSix

    # 登录页
    LANDING_PAGE_URL = 'http://mail.126.com'

    # 联系人 URL 模板
    Contacts_URL = "http://tg1a64.mail.126.com/jy3/address/addrlist.jsp?sid=%s"

    def self.fetch invitor_email_address,invitor_email_password
      self.new(invitor_email_address,invitor_email_password).contacts
    end

    
    def initialize invitor_email_address,invitor_email_password
      @invitor_email_address = invitor_email_address
      @invitor_email_password = invitor_email_password
      @agent = Mechanize.new
    end

    # 通讯录联系人
    # @return [Array<EmailSpy::Contract>] 
    def contacts
      body = @agent.get(Contacts_URL % sid).body 
      contacts = []

      Nokogiri::HTML(body).xpath(".//*[@id='addrstable']/tbody[1]/tr").each do |tr|
        contacts << Contact.new(tr.css(".Ibx_Td_addrName a").text,
                           tr.css(".Ibx_Td_addrEmail a").text)
      end

      contacts
    end

    private 

    # 登录
    # @return [String] SID
    def sid
      page = @agent.get(LANDING_PAGE_URL)
      login_form = page.forms[0]
      login_form.action= 'http://reg.163.com/login.jsp'
      login_form.add_field!('type',1)
      login_form.add_field!('product','mail126')
      login_form.add_field!('url' ,URI.encode("http://entry.mail.126.com/cgi/ntesdoor?hid=10010102&lightweight=1&language=0&style=3"))
      login_form.username ,login_form.password = @invitor_email_address,@invitor_email_password
      page = login_form.submit(login_form.buttons.first)
      page1 = login_form.click_button
      page2 = page1.links[0].click

      page3 = @agent.get('http://entry.mail.126.com/cgi/ntesdoor?verifycookie=1&lightweight=1&style=-1')
      page3.uri.to_s.scan(/sid=(\S+)/).first[0]
    end
  end

  private
  
  EMAIL_TYPE['126'] = "OneTowSix"
end
