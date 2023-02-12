FactoryBot.define do

  factory :user do
    nickname              {"kumamon"}
    email                 {Faker::Internet.email}
    password              { 'a1' + Faker::Internet.password(min_length: 4) }
    password_confirmation {password}
    family_name           {"熊本"}
    family_name_kana      {"クマモト"}
    first_name            {"太郎"}
    first_name_kana       {"タロウ"}
    birth_day             {"2000-01-01"}
  end
end   