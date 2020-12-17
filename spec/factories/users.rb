FactoryBot.define do
  factory :user do
    nickname { Faker::Internet.user_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password
    password {password}
    password_confirmation {password}
  end
end
