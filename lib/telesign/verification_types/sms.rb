module Telesign
  module Request
    class SMS
      @@verification_type = :sms
      
      def initialize(country_code = 'US', phone_number)
        API.request(country_code, phone_number, @@verification_type)
      end
    end  
  end
end