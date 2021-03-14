FactoryBot.define do
  factory :item do
    name                { 'おもちゃ' }
    text                { '最高' }
    category_id         { 5 }
    status_id           { 3 }
    delivery_fee_id     { 2 }
    prefectures_id      { 10 }
    days_to_ship_id     { 2 }
    price               { 5000 }
    association         :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
