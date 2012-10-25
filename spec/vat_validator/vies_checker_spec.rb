require File.dirname(__FILE__) + '/../spec_helper'

# Note : this SPEC collection makes direct calls to the VIES webservice.
# Maybe I need to use a mock ?

describe ViesCheckedInvoice do
  it "should be valid if vat number is correct" do
    VatValidations::ViesChecker.check('BE0817331995').should be_true
    ViesCheckedInvoice.new(:vat_number => 'BE0817331995').should be_valid
  end

  it "should not be valid if vat number is correct" do
    VatValidations::ViesChecker.check('BE000678345').should_not be_true
    ViesCheckedInvoice.new(:vat_number => 'BE000678345').should_not be_valid
  end

  it "should not be valid if the input is not valid" do
    VatValidations::ViesChecker.check('blop').should_not be_true
  end

  it "should raise an exception if VIES is unreachable" do
    lambda {WrongViesCheckedInvoice.new(:vat_number => 'BE0817331995').valid?}.should raise_error(VatValidations::ViesContactError)
  end
end
