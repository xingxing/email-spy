module EmailSpy
  class EmailSypError < StandardError
  end

  class AuthenticationError < EmailSypError
    def initialize(msg = "Email address or password are incorrect")
      super(msg)
    end
  end

  class ConnectionError < EmailSypError
    def initialize(msg = "Check your network connection")
      super(msg)
    end
  end

  class EmailTypeNotFound < EmailSypError
    def initialize(msg = "Does not support this message type")
      super(msg)
    end
  end
end
