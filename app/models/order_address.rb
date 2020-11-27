class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :state_id, :city, :block_number, :building_name, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'Input correctly' }
    validates :state_id, numericality: { other_than: 1, message: 'Select' }
    validates :city
    validates :block_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'Input only number' }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, state_id: state_id, city: city, block_number: block_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
