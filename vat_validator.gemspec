Gem::Specification.new do |s|
  s.name = "vat_validator"
  s.summary = "Validator for european countries VAT numbers for ActiveModel"
  s.description = "Validator for european countries VAT numbers for ActiveModel"
  s.homepage = "http://github.com/aurels/vat_validator"
  
  s.version = "1.0"
  s.date = "2010-05-19"
  
  s.authors = ["Aurélien Malisart"]
  s.email = "aurelien.malisart@gmail.com"
  
  s.require_paths = ["lib"]
  s.files = Dir["lib/**/*"] + Dir["spec/**/*"] + ["README.rdoc", "Rakefile"]
  s.extra_rdoc_files = ["README.rdoc"]
  
  s.has_rdoc = false

  s.rubygems_version = "1.3.4"
  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6")
  
  s.add_dependency 'soap'
  s.add_dependency 'soap4r'
end