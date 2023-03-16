class Organisation < ApplicationRecord
  validates :ppon_id, presence: true, uniqueness: { case_sensitive: false }
  validates :ppon_id, format: { with: /[A-Za-z]{2}\d{4}[A-Za-z]{2}\d\z/ }
end
