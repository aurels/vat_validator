require 'rubygems'
require 'savon'

# Errors:
# from http://blog.riff.org/2007_04_08_soap_box_accessing_vies_from_phpgtk
# 'INVALID_INPUT'       => 'The provided CountryCode is invalid or the VAT number is empty',
# 'SERVICE_UNAVAILABLE' => 'The SOAP service is unavailable, try again later',
# 'MS_UNAVAILABLE'      => 'The Member State service is unavailable, try again later or with another Member State',
# 'TIMEOUT'             => 'The Member State service could not be reached in time, try again later or with another Member State',
# 'SERVER_BUSY'         => 'The service cannot process your request. Try again later.'

module VatValidations
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

      rescue Savon::SOAP::Fault => fault
        # https://github.com/rubiii/savon/blob/master/lib/savon/soap/fault.rb
        if fault.to_hash[:fault][:faultstring] == "{ 'INVALID_INPUT' }"
          return false
        else
          raise ViesContactError
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