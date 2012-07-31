module EmailSpy
  class Gmail

    Contacts_API_URL =  "http://www.google.com/m8/feeds/contacts/default/full"

    def self.fetch invitor_email_address,invitor_email_password
      client = GData::Client::Contacts.new
      client.clientlogin(invitor_email_address, invitor_email_password)
      response = client.get(Contacts_API_URL).to_xml
      
      response.elements.to_a('entry').map do |entry|
        title, email = entry.elements['title'].text, nil
        entry.elements.each('gd:email') do |e|
          email = e.attribute('address').value if e.attribute('primary')
        end
        Contact.new(title,email) unless email.nil?
      end.compact
    rescue GData::Client::AuthorizationError => e
      raise AuthenticationError
    end
  end
end
