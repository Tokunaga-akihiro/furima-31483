class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_fee
  belongs_to :ship_date
  belongs_to :shipping_area
  belongs_to :status

  validates :category_id, numericality: { other_than: 1 }
  validates :shipping_area_id, numericality: { other_than: 0 }
  validates :status_id, numericality: { other_than: 1 }
  validates :delivery_fee_id, numericality: { other_than: 1 }
  validates :ship_date_id, numericality: { other_than: 1 }

  with_options presence: true do
  validates  :image
  validates  :category_id
  validates  :delivery_fee_id
  validates  :ship_date_id
  validates  :shipping_area_id
  validates  :status_id
  validates  :product_name
  validates  :description
  validates  :price

  validates_format_of :price, with: 	/\A[0-9]+\z/
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
end