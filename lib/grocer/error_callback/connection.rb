module Grocer::ErrorCallback::Connection
  def self.included(base)
    base.class_eval do
      remove_method :with_connection
    end
  end

  def with_connection
    attempts = 1
    begin
      connect
      yield
    rescue => e
      if e.class == OpenSSL::SSL::SSLError && e.message =~ /certificate expired/i
        e.extend(CertificateExpiredError)
        raise
      end

      run_callbacks :connection_error, e

      raise unless attempts < retries

      destroy_connection
      attempts += 1
      retry
    end
  end
end
