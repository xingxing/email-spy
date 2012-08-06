module EmailSpy
  class Yahoo

    LANDING_PAGE_URL = 'https://login.yahoo.com/config/login'

    CONTACTS_URL = "http://address.mail.yahoo.com/?.rand=430244936"

    def self.fetch invitor_email_address,invitor_email_password
      self.new(invitor_email_address,invitor_email_password).contacts
    rescue SocketError => e
      raise ConnectionError
    end

    def initialize invitor_email_address,invitor_email_password
      @invitor_email_address = invitor_email_address
      @invitor_email_password = invitor_email_password
      @agent = Mechanize.new
      @agent.verify_mode = OpenSSL::SSL::VERIFY_NONE
    end

    def contacts
      login
      contacts = []
      contacts_json.each do |contact|
        contacts << Contact.new(contact['contactName'],contact['email'])
      end
      
      contacts 
    end


    private

    def login
      page = @agent.get(LANDING_PAGE_URL)
      login_form = page.forms[0]
      login_form.login  = @invitor_email_address
      login_form.passwd = @invitor_email_password
      page = login_form.submit
      raise AuthenticationError if page.body.index("Invalid ID or passowrd") or page.body.index("This ID is not yet taken")
    end


    def contacts_json
      contacts_list_source = @agent.get(CONTACTS_URL).body
      contacts_json = contacts_list_source.scan(/InitialContacts\s*=([^;]*);/m)[0][0].to_s
      JSON.load(contacts_json).flatten
    end

  end

  private 

  EMAIL_TYPE['yahoo'] = "Yahoo"
end
