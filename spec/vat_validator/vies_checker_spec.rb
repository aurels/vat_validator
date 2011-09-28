require File.dirname(__FILE__) + '/../spec_helper'

# Note : this SPEC collection makes direct calls to the VIES webservice.
# Maybe I need to use a mock ?

describe ViesCheckedInvoice do
  it "should be valid if vat number is correct" do
    ViesCheckedInvoice.new(:vat_number => 'BE0817331995').should be_valid
  end
  
  it "should not be valid if vat number is correct" do
    ViesCheckedInvoice.new(:vat_number => 'BE000678345').should_not be_valid
  end

  it "should raise an exception if VIES is unreachable" do
    lambda {WrongViesCheckedInvoice.new(:vat_number => 'BE0817331995').valid?}.should raise_error(VatValidator::ViesContactError)
  end
end