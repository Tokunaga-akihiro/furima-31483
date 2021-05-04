 FactoryBot.define do
  factory :item do
    category_id {2}
    status_id {2}
    delivery_fee_id {2}
    shipping_area_id {2}
    ship_date_id {2}
    price  {301}
    description  {"あああ"}
    product_name  {"キウイ"}
    association :user
    after(:build) do |item|
    item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end
  end
end
