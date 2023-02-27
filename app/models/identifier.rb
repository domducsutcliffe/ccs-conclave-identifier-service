class Identifier < ApplicationRecord
  validates :ccs_id, presence: true
  validates :id_type, presence: true
  validates :ccs_persisted, presence: true
end
