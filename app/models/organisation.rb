class Organisation < ApplicationRecord
  validates :PPON_ID, presence: true, uniqueness: true
  validates :PPON_ID, format: { with: /[A-Za-z]{2}\d{4}[A-Za-z]{2}\d\z/ }
end
