require 'rubygems'
require 'savon'

module VatValidator
  class ViesChecker  
    def self.check(country_code, vat_number, vies_host='http://ec.europa.eu/taxation_customs/vies/checkVatService.wsdl')
      client = Savon::Client.new(vies_host)

      begin
        response = client.request :check_vat do
          soap.body = {
            :country_code => country_code, 
            :vat_number => vat_number
          }
        end
      rescue
        raise ViesContactError
      end

      if response.success?
        return response[:check_vat_response][:valid]
      else
        raise ViesContactError
      end
    end
  end
end