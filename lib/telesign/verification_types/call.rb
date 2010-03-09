module Telesign
  module Request
    class Call
      @@verification_type = :call
      
      def initialize(country_code = 'US', phone_number)
        API.request(country_code, phone_number, @@verification_type)
      end      
    end  
  end
end