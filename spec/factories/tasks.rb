FactoryBot.define do
  factory :task do
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    done { false }
    deadline { Faker::Date.forward }
    user_id { "1" }
  end
end
