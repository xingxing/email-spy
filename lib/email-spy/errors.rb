module EmailSpy
  class EmailSayError < StandardError
  end

  class AuthenticationError < EmailSayError
    def initialize(msg = "Email address or password are incorrect")
      super(msg)
    end
  end

  class ConnectionError < EmailSayError
  end

  class TypeNotFound < EmailSayError
  end
end
