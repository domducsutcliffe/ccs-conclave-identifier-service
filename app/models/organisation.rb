class Organisation < ApplicationRecord

    validates :ORG_ID, presence: true, uniqueness: true, numericality: true
    # validates :PPON_ID, presence: true, uniqueness: true
    # validates_format_of :PPON_ID, :with => /[A-Za-z]{2}\d{4}[A-Za-z]{2}\z/
end

