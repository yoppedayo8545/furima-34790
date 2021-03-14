FactoryBot.define do
  factory :purchase_address do
    postal_code            { '123-4567' }
    prefectures_id         { 2 }
    municipality           { '朝霞市東弁財' }
    address                { '1-2-3' }
    building_name          { 'ノアビル' }
    phone_num              { '09012345678' }
    token                  { 'tok_abcdefghijk00000000000000000' }
  end
end
