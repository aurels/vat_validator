require File.dirname(__FILE__) + '/../spec_helper'

describe Invoice do
  
  # DE
  
  it "should validate well a DE vat number" do
    Invoice.new(:vat_number => "DE345889003").should be_valid
    
    Invoice.new(:vat_number => "DE34588900").should_not be_valid
    Invoice.new(:vat_number => "DE3458890090").should_not be_valid
    Invoice.new(:vat_number => "DE34588900C").should_not be_valid
  end

  # AT
  
  it "should validate well a AT vat number" do
    Invoice.new(:vat_number => "ATU03458890").should be_valid
    
    Invoice.new(:vat_number => "ATU034588908").should_not be_valid
    Invoice.new(:vat_number => "ATU0345908").should_not be_valid
    Invoice.new(:vat_number => "ATU0345889Y").should_not be_valid
  end
  
  # BE
  
  it "should validate well a BE vat number" do
    Invoice.new(:vat_number => "BE0817331995").should be_valid
    
    Invoice.new(:vat_number => "BE081733199").should_not be_valid
    Invoice.new(:vat_number => "BE08173319944").should_not be_valid
    Invoice.new(:vat_number => "BE081733199H").should_not be_valid
  end
  
  # BG
  
  it "should validate well a BG vat number" do
    Invoice.new(:vat_number => "BG468134789").should be_valid
    Invoice.new(:vat_number => "BG4681347897").should be_valid
    
    Invoice.new(:vat_number => "BG46813478979").should_not be_valid
    Invoice.new(:vat_number => "BG4681347897C").should_not be_valid
    Invoice.new(:vat_number => "BG46813478G").should_not be_valid
    Invoice.new(:vat_number => "BG46813478").should_not be_valid
  end

  # CY
  
  it "should validate well a CY vat number" do
    Invoice.new(:vat_number => "CY36579347A").should be_valid
    
    Invoice.new(:vat_number => "CY36579347").should_not be_valid
    Invoice.new(:vat_number => "CY365793478").should_not be_valid
    Invoice.new(:vat_number => "CY365793G").should_not be_valid
  end

  # DK
  
  it "should validate well a DK vat number" do
    Invoice.new(:vat_number => "DK67893463").should be_valid
    
    Invoice.new(:vat_number => "DK678934637").should_not be_valid
    Invoice.new(:vat_number => "DK6789346").should_not be_valid
    Invoice.new(:vat_number => "DK6789346H").should_not be_valid
  end

  # ES
  
  it "should validate well a ES vat number" do
    Invoice.new(:vat_number => "ES567345987").should be_valid
    Invoice.new(:vat_number => "ES5673459879").should_not be_valid
    
    Invoice.new(:vat_number => "ES56734598").should_not be_valid
    Invoice.new(:vat_number => "ES56734598J").should_not be_valid
  end

  # EE
  
  it "should validate well a EE vat number" do
    Invoice.new(:vat_number => "EE678678456").should be_valid
    Invoice.new(:vat_number => "EE6786784560").should_not be_valid
    Invoice.new(:vat_number => "EE67867845").should_not be_valid
    Invoice.new(:vat_number => "EE67867845K").should_not be_valid
  end

  # FI
  
  it "should validate well a FI vat number" do
    Invoice.new(:vat_number => "FI67845638").should be_valid
    
    Invoice.new(:vat_number => "FI678456389").should_not be_valid
    Invoice.new(:vat_number => "FI6784563").should_not be_valid
    Invoice.new(:vat_number => "FI6784563K").should_not be_valid
  end

  # FR
  
  it "should validate well a FR vat number" do
    Invoice.new(:vat_number => "FR99123543267").should be_valid
    Invoice.new(:vat_number => "FRBB123543267").should be_valid
    Invoice.new(:vat_number => "FR9B123543267").should be_valid
    Invoice.new(:vat_number => "FRB9123543267").should be_valid
    
    Invoice.new(:vat_number => "FR99123543267B").should_not be_valid
    Invoice.new(:vat_number => "FRBB12354326").should_not be_valid
    Invoice.new(:vat_number => "FR9B123543F67").should_not be_valid
    Invoice.new(:vat_number => "FRB9123543").should_not be_valid
  end

  # EL
  
  it "should validate well a EL vat number" do
    Invoice.new(:vat_number => "EL678456345").should be_valid
    
    Invoice.new(:vat_number => "EL67845634").should_not be_valid
    Invoice.new(:vat_number => "EL6784563459").should_not be_valid
    Invoice.new(:vat_number => "EL67845634P").should_not be_valid
  end

  # HU
  
  it "should validate well a HU vat number" do
    Invoice.new(:vat_number => "HU67894595").should be_valid
    
    Invoice.new(:vat_number => "HU6789459").should_not be_valid
    Invoice.new(:vat_number => "HU67894595L").should_not be_valid
    Invoice.new(:vat_number => "HU6789459J").should_not be_valid
  end

  # IE
  
  it "should validate well a IE vat number" do
    Invoice.new(:vat_number => "IE1B12345J").should be_valid
    Invoice.new(:vat_number => "IE1234567B").should be_valid
    
    Invoice.new(:vat_number => "IE1B123459").should_not be_valid
    Invoice.new(:vat_number => "IE19123450").should_not be_valid
    Invoice.new(:vat_number => "IEA9123450").should_not be_valid
  end

  # IT
  
  it "should validate well a IT vat number" do
    Invoice.new(:vat_number => "IT45875359285").should be_valid
    
    Invoice.new(:vat_number => "IT458753592859").should_not be_valid
    Invoice.new(:vat_number => "IT4587535928G").should_not be_valid
    Invoice.new(:vat_number => "IT4587535928").should_not be_valid
  end

  # LV
  
  it "should validate well a LV vat number" do
    Invoice.new(:vat_number => "LV85678368906").should be_valid
    
    Invoice.new(:vat_number => "LV8567836890").should_not be_valid
    Invoice.new(:vat_number => "LV856783689066").should_not be_valid
    Invoice.new(:vat_number => "LV8567836890S").should_not be_valid
  end

  # LT
  
  it "should validate well a LT vat number" do
    Invoice.new(:vat_number => "LT678678987").should be_valid
    Invoice.new(:vat_number => "LT678678987956").should be_valid
    
    Invoice.new(:vat_number => "LT67867898").should_not be_valid
    Invoice.new(:vat_number => "LT6786789870").should_not be_valid
    Invoice.new(:vat_number => "LT678678987K").should_not be_valid
    Invoice.new(:vat_number => "LT67867898709").should_not be_valid
    Invoice.new(:vat_number => "LT6786789870C").should_not be_valid
    Invoice.new(:vat_number => "LT67867898795H").should_not be_valid
  end

  # LU
  
  it "should validate well a LU vat number" do
    Invoice.new(:vat_number => "LU45679456").should be_valid
    
    Invoice.new(:vat_number => "LU4567945").should_not be_valid
    Invoice.new(:vat_number => "LU456794560").should_not be_valid
    Invoice.new(:vat_number => "LU4567945J").should_not be_valid
  end

  # MT
  
  it "should validate well a MT vat number" do
    Invoice.new(:vat_number => "MT64569367").should be_valid
    
    Invoice.new(:vat_number => "MT6456936").should_not be_valid
    Invoice.new(:vat_number => "MT645693679").should_not be_valid
    Invoice.new(:vat_number => "MT6456936L").should_not be_valid
  end

  # NL
  
  it "should validate well a NL vat number" do
    Invoice.new(:vat_number => "NL673739491A77").should be_valid
    
    Invoice.new(:vat_number => "NL673739491977").should_not be_valid
    Invoice.new(:vat_number => "NL67373949197").should_not be_valid
    Invoice.new(:vat_number => "NL67373949").should_not be_valid
  end

  # PL
  
  it "should validate well a PL vat number" do
    Invoice.new(:vat_number => "PL6784567284").should be_valid
    
    Invoice.new(:vat_number => "PL678456728").should_not be_valid
    Invoice.new(:vat_number => "PL67845672849").should_not be_valid
    Invoice.new(:vat_number => "PL678456728K").should_not be_valid
  end

  # PT
  
  it "should validate well a PT vat number" do
    Invoice.new(:vat_number => "PT346296476").should be_valid
    
    Invoice.new(:vat_number => "PT34629647").should_not be_valid
    Invoice.new(:vat_number => "PT3462964769").should_not be_valid
  end

  # GB
  
  it "should validate well a GB vat number" do
    Invoice.new(:vat_number => "GB123456789").should be_valid
    Invoice.new(:vat_number => "GBAB123").should be_valid
    Invoice.new(:vat_number => "GBA0123").should be_valid
    Invoice.new(:vat_number => "GB0B123").should be_valid
    Invoice.new(:vat_number => "GB00123").should be_valid
    
    Invoice.new(:vat_number => "GB12345678").should_not be_valid
    Invoice.new(:vat_number => "GBAB1238").should_not be_valid
    Invoice.new(:vat_number => "GBA0123L").should_not be_valid
    Invoice.new(:vat_number => "GB0B12300").should_not be_valid
    Invoice.new(:vat_number => "GB00123L").should_not be_valid
  end

  # RO
  
  it "should validate well a RO vat number" do
    Invoice.new(:vat_number => "RO856723965").should be_valid
  end

  # SK
  
  it "should validate well a SK vat number" do
    Invoice.new(:vat_number => "SK5683075682").should be_valid
  end

  # SI
  
  it "should validate well a SI vat number" do
    Invoice.new(:vat_number => "SI74357893").should be_valid
  end

  # SE
  
  it "should validate well a SE vat number" do
    Invoice.new(:vat_number => "SE567396352789").should be_valid
  end

  # CZ
  
  it "should validate well a CZ vat number" do
    Invoice.new(:vat_number => "CZ56389267").should be_valid
    Invoice.new(:vat_number => "CZ563892670").should be_valid
    Invoice.new(:vat_number => "CZ5638926790").should be_valid
  end
  
  # Blank
  
  it "should not be valid if vat number is blank" do
    Invoice.new(:vat_number => '').should_not be_valid
  end
  
  # Misc
  
  it "should be invalid if really non-sense VAT number is passed" do
    Invoice.new(:vat_number => '345678').should_not be_valid
    Invoice.new(:vat_number => 'BE').should_not be_valid
    Invoice.new(:vat_number => 'BEFR').should_not be_valid
    Invoice.new(:vat_number => 'ZERTYU').should_not be_valid
    Invoice.new(:vat_number => 'be817331995').should_not be_valid
    Invoice.new(:vat_number => '&hczeà').should_not be_valid
  end
end

describe OptionalVatInvoice do
  it "should be valid if vat number is correct" do
    OptionalVatInvoice.new(:vat_number => 'BE0817331995').should be_valid
  end
  
  it "should not be valid if vat number is incorrect" do
    OptionalVatInvoice.new(:vat_number => 'BE081733199').should_not be_valid
  end
  
  it "should be valid if vat number is blank" do
    OptionalVatInvoice.new(:vat_number => '').should be_valid
  end
end

describe CountryCheckedInvoice do
  it "should be valid if vat number is correct and matches country" do
    CountryCheckedInvoice.new(
      :vat_number => 'BE0817331995',
      :country    => 'Belgium'
    ).should be_valid
    
    CountryCheckedInvoice.new(
      :vat_number => 'FRBB123543267',
      :country    => 'France'
    ).should be_valid
  end
  
  it "should not be valid if vat number is correct and does not match country" do    
    CountryCheckedInvoice.new(
      :vat_number => 'BE0817331995',
      :country    => ''
    ).should_not be_valid
    
    CountryCheckedInvoice.new(
      :vat_number => 'BE0817331995',
      :country    => 'France'
    ).should_not be_valid
    
    CountryCheckedInvoice.new(
      :vat_number => 'BE0817331995',
      :country    => 'FunkyCountry'
    ).should_not be_valid
  end
  
  it "should be valid if vat number is blank" do
    CountryCheckedInvoice.new(
      :vat_number => '',
      :country    => ''
    ).should_not be_valid
    
    CountryCheckedInvoice.new(
      :vat_number => '',
      :country    => 'Belgium'
    ).should_not be_valid
  end
end