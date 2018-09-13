class Staff < ApplicationRecord
  validates :staff_id, presence: true, length: { maximum: 10 }, uniqueness: true
  validates :staff_name, presence: true, length: { maximum: 30 }
  validates :postal_code, presence: true, length: { is: 7 }
  validates :street_address_1, presence: true, length: { maximum: 255 }
  validates :street_address_2, length: { maximum: 255 }
  validates :phone_number_1, presence: true, length: { maximum: 11 }
  validates :phone_number_2, length: { maximum: 11 }
  validates :remarks, length: { maximum: 1000 }
  has_many :stock
end
