FactoryBot.define do

  factory :user do
    sequence :email do |n|
      "email#{n}@example.com"
    end
    password '12345678'
    sequence :subdomain do |n|
      "subdomain#{n}"
    end
  end
end