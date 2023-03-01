FactoryBot.define do
  
  factory :destination_purchase do
    post_code              { "123-4567" }
    prefecture_id          {"2"}
    municipality           {"くまもと市くまもと区くまもと町"}
    address                {"1-1"}
    building_name          {"くまもとビル202"}
    phone_number           { "09012345678" }
    token {"tok_abcdefghijk00000000000000000"}

    association :user
    association :item
  end
end
