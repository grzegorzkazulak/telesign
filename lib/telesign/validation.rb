module Telesign
  module Validation
    def sanitize(string)
      string.gsub(/\D/, '')[/^(0*)(\d*)$/, 2]
    end    
  end
end