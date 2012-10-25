Gem::Specification.new do |s|
  s.name = "vat_validator"
  s.summary = "Validator for european countries VAT numbers for ActiveModel"
  s.description = "Validator for european countries VAT numbers for ActiveModel"
  s.homepage = "http://github.com/aurels/vat_validator"

  s.version = "1.2"
  s.date = "2011-09-30"

  s.authors = ["Aurelien Malisart", "Francois Stephany"]
  s.email = "aurelien.malisart@gmail.com"

  s.require_paths = ["lib"]
  s.files = Dir["lib/**/*"] + Dir["spec/**/*"] + ["README.rdoc", "Rakefile"]
  s.extra_rdoc_files = ["README.rdoc"]

  s.has_rdoc = false

  s.rubygems_version = "1.6.2"
  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6")

  s.add_dependency('activemodel')
  s.add_dependency('savon', ">= 0.9.7")
  s.add_development_dependency('rspec', ">= 2.0.0")
end
