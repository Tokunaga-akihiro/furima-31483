class Order
  include ActiveModel::Model
  attr_accessor :postal_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number, :item_id, :user_id

  # ここにバリデーションの処理を書く
  with_options presence: true do
  validates :postal_code, format: {with: /\A\d{3}[-]\d{4}\z/}
  validates :shipping_area_id
  validates :municipality
  validates :address
  validates :phone_number, format: {with: /\A\d{11}\z/}

  # validates_format_of :postal_code,  with:  /\A\d{3}[-]\d{4}\z/
  # validates_format_of :phone_number, with:  /\A\d{11}\z/
  end

  def save
  # 各テーブルにデータを保存する処理を書く
     Profile.create(postal_code: postal_code, shipping_area_id: shipping_area_id, municipality: municipality, address: address, building_name: building_name)
     PurchaseRecord.create(item_id: item_id, user_id: user_id)
  end
end