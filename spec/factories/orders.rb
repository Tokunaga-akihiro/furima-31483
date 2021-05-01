FactoryBot.define do
  factory :order do
    postal_code {"123-4567"}
    shipping_area_id {3}
    municipality {"横浜市緑区"}
    address {"青山1-1-1"}
    phone_number { "00011112222" }
  end
end
