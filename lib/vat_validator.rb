require 'active_model'
require 'exceptions'
require 'vies_checker' rescue nil

module VatValidations

  # Constants ------------------------------------------------------------------

  VAT_PATTERNS = {
      'DE' => /\ADE[0-9]{9}\Z/,                                # Germany
      'AT' => /\AATU[0-9]{8}\Z/,                               # Austria
      'BE' => /\ABE[0-9]{10}\Z/,                               # Belgium
      'BG' => /\ABG[0-9]{9,10}\Z/,                             # Bulgaria
      'CY' => /\ACY[0-9]{8}[A-Z]\Z/,                           # Cyprus
      'DK' => /\ADK[0-9]{8}\Z/,                                # Denmark
      'ES' => /\AES[A-Z0-9]{1}[0-9]{7}[A-Z0-9]{1}\Z/,          # Spain
      'EE' => /\AEE[0-9]{9}\Z/,                                # Estonia
      'FI' => /\AFI[0-9]{8}\Z/,                                # Finland
      'FR' => /\AFR[A-Z0-9]{2}[0-9]{9}\Z/,                     # France
      'EL' => /\AEL[0-9]{9}\Z/,                                # Greece
      'HU' => /\AHU[0-9]{8}\Z/,                                # Hungary
      'IE' => /\AIE([0-9][A-Z][0-9]{5}[A-Z]|[0-9]{7}[A-Z])\Z/, # Ireland
      'IT' => /\AIT[0-9]{11}\Z/,                               # Italy
      'LV' => /\ALV[0-9]{11}\Z/,                               # Latvia
      'LT' => /\ALT([0-9]{9}|[0-9]{12})\Z/,                    # Lithuania
      'LU' => /\ALU[0-9]{8}\Z/,                                # Luxembourg
      'MT' => /\AMT[0-9]{8}\Z/,                                # Malta
      'NL' => /\ANL[0-9]{9}[A-Z][0-9]{2}\Z/,                   # Netherlands
      'PL' => /\APL[0-9]{10}\Z/,                               # Poland
      'PT' => /\APT[0-9]{9}\Z/,                                # Portugal
      'GB' => /\AGB([0-9]{9}|[A-Z0-9]{2}[0-9]{3})\Z/,          # United Kingdom
      'RO' => /\ARO[0-9]{9}\Z/,                                # Romania
      'SK' => /\ASK[0-9]{10}\Z/,                               # Slovakia
      'SI' => /\ASI[0-9]{8}\Z/,                                # Slovenia
      'SE' => /\ASE[0-9]{12}\Z/,                               # Sweden
      'CZ' => /\ACZ[0-9]{8,10}\Z/                              # Czech Republic
    }

  # Classes --------------------------------------------------------------------

  class VatValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      format_valid = true

      country_code = options[:country_method] ? record.send(options[:country_method]).to_s : nil
      unless VatNumber.new(value, country_code).valid?
        record.errors.add(attribute, options[:message])
        format_valid = false
      end

      if format_valid && options[:vies]
        if options[:vies_host]
          valid = ViesChecker.check(value, false, options[:vies_host])
        else
          valid = ViesChecker.check(value, false)
        end

        unless valid
         record.errors.add(attribute, options[:message])
        end
      end
    end
  end

  class VatNumber
    def initialize(number, country_code = nil)
      @number = number
      @country_code = country_code
    end

    def valid?
      if @country_code
        VAT_PATTERNS.has_key?(@country_code) && @number.to_s =~ VAT_PATTERNS[@country_code]
      else
        VAT_PATTERNS.values.detect { |p| @number.to_s =~ p }
      end
    end
  end
end

ActiveModel::Validations.__send__(:include, VatValidations)
