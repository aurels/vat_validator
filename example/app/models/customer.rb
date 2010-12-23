class Customer < ActiveRecord::Base
  validates :vat_number, :vat => true, :presence => true
end
