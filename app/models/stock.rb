class Stock < ApplicationRecord
  validates :product_type,  presence: true
  belongs_to :staff
end
