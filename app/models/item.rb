class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :buy

  with_options presence: true do
    validates :product
    validates :description
    validates :category_id
    validates :status_id
    validates :ship_method_id
    validates :shipment_source_id
    validates :days_to_ship_id
    validates :price #価格の範囲指定 半角数字のみ機能追加すること
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status_id
  belongs_to_active_hash :ship_method
  belongs_to_active_hash :shipment_source
  belongs_to_active_hash :days_to_ship
end