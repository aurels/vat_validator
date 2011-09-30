require 'rubygems'
require 'savon'

module VatValidator
  class ViesChecker
    def self.check(complete_vat_number, vies_host='http://ec.europa.eu/taxation_customs/vies/checkVatService.wsdl')
      
      country_code = complete_vat_number[0..1]
      vat_number   = complete_vat_number[2..15]

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