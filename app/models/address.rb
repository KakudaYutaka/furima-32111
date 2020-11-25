class Address < ApplicationRecord
  belongs_to :order


  with_options presence: true do
    validates :postal_code
    validates :state_id
    validates :city
    validates :block_number
    validates :phone_number
  end
end