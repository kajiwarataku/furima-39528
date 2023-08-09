FactoryBot.define do
  factory :item do
    name               { '車' }
    description        { '大切に乗っていました' }
    category_id        { 2 }
    condition_id       { 2 }
    bear_id            { 2 }
    area_id            { 2 }
    send_day_id        { 2 }
    price              { 1_234_567 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/sample/sky.jpeg'), filename: 'sky.jpeg')
    end
  end
end
