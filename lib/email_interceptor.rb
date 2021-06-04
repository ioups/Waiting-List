class EmailInterceptor
    def self.delivering_email(message)
      message.subject = "#{message.to} #{message.subject}"
      message.to = [ 'pe.daigre@gmail.com' ]
    end
  end