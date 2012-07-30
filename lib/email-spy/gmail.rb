module EmailSpy
  module Gmail

    Contacts_API_URL =  "http://www.google.com/m8/feeds/contacts/default/full"

    def self.fetch invitor_email_address,invitor_email_password
      client = GData::Client::Contacts.new
      client.clientlogin(invitor_email_address, invitor_email_password)
      response = client.get(Contacts_API_URL).body
      Nokogiri::XML(response).search("entry").map do |contact_info|
        Contact.new(contact_info.search("title").first.text,
                    contact_info.xpath("gd:email").attr("address").value)
      end
    end
  end
end
