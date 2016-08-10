FactoryGirl.define do
  factory :url_content do
    url { Faker::Internet.url }
    h1_content { Faker::Lorem.paragraph }
    h2_content { Faker::Lorem.paragraph }
    h3_content { Faker::Lorem.paragraph }
    link_content { Faker::Lorem.paragraph }
  end
end
