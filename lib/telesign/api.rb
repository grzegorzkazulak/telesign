module Telesign
  class API
    include Validation
    include PinGeneration
    
    SUCCESS_CODE = '0'
    
    def initialize(pin_length = 3, delay_time = 0, redial_count = 1)
      @pin_length, @delay_time, @redial_count = pin_length, delay_time, redial_count
    end
    
    def request(country_code = 'US', phone_number, request_type)
      driver = setup_soap_driver
      self.dispatch(request_type, driver)    
    end
    
    def setup_soap_driver
      driver = SOAP::RPC::Driver.new(ENV['telesign_soap_url'], Telesign::TELESIGN_API_URL)
      driver.options["receive_timeout"] = 120
      driver.default_encodingstyle = SOAP::EncodingStyle::ASPDotNetHandler::Namespace
      driver
    end
    
    def dispatch(request_type, driver)
      response = case request_type
      when :sms
        @driver.RequestSMS(@cid, @aid, @country_code, @phone_number, @pin, @message)
      when :call
        @driver.RequestCALL(@cid, @aid, @country_code, @phone_number, @pin, @delay_time, @redial_count, @ext_content, @ext_type, @message)
      else
        raise NotImplementedError
      end
      raise TelesignError, "Code #{response['APIError']['Code']}: #{response['APIError']['Message']}" if response['APIError']['Code'] unless SUCCESS_CODE
    end
  end
end