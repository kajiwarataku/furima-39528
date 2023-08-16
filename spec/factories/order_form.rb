FactoryBot.define do
  factory :order_form do
    post_code            { '123-4567' }
    area_id              { 2 }
    municipality         { '横浜市緑区' }
    house_number         { '青山1-1-1' }
    building_name        { '柳ビル103' }
    telephone_number     { '12345678901' }
    token                {'tok_0000000000000000000000000000'}
  end
end
