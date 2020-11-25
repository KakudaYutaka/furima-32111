class Address < ApplicationRecord
  belongs_to :order


  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'Input correctly' }
    validates :state_id
    validates :city
    validates :block_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'Input only number' }
  end
end