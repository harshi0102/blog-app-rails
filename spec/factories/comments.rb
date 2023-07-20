FactoryBot.define do
  factory :comment do
    association :author, factory: :user # Assuming your User factory is named :user
    association :post # This will automatically create a post and associate it with the comment
    text { 'This is a comment content' } # Use the same attribute name as in the Post factory
  end
end
