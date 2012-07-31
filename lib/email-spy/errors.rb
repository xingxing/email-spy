module EmailSpy
  class EmailSayError < StandardError
  end

  class AuthenticationError < EmailSayError
  end

  class ConnectionError < EmailSayError
  end

  class TypeNotFound < EmailSayError
  end
end
