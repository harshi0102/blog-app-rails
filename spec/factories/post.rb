FactoryBot.define do
  factory :post do
    title { Faker::Lorem.sentence }
    text { Faker::Lorem.paragraph }
    comments_counter { 0 }
    # Other attributes as needed...
  end
end
