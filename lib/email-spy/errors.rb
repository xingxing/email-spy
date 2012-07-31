module EmailSpy
  class EmailSayError < StandardError
  end

  class AuthenticationError < EmailSayError
    def initialize(msg = "Email address or password are incorrect")
      super(msg)
    end
  end

  class ConnectionError < EmailSayError
    def initialize(msg = "Check your network connection")
      super(msg)
    end
  end

  class EmailTypeNotFound < EmailSayError
    def initialize(msg = "Does not support this message type")
      super(msg)
    end
  end
end
