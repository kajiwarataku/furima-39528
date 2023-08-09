FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6, mix_case: true, special_characters: false) }
    password_confirmation { password }
    last_name             { '山田' }
    first_name            { '太郎' }
    last_name_katakana    { 'ヤマダ' }
    first_name_katakana   { 'タロウ' }
    birth_date            { '2023-01-01' }
  end
end
