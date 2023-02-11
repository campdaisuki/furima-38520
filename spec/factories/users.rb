FactoryBot.define do

  factory :user do
    nickname              {"kumamon"}
    email                 {Faker::Internet.email}
    password              {"1234567"}
    password_confirmation {"1234567"}
    family_name           {"熊本"}
    family_name_kana      {"クマモト"}
    first_name            {"太郎"}
    first_name_kana       {"タロウ"}
    birth_day             {"2000-01-01"}
  end
end   