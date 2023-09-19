FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    encrypted_password { Devise::Encryptor.digest(User, 'password') } # Replace 'password' with your desired password
    reset_password_token { nil }
    reset_password_sent_at { nil }
    remember_created_at { nil }
    name { Faker::Name.name }
    jti { SecureRandom.uuid }
    gender { rand(0..2) } # Assuming 0, 1, 2 represent different genders (you can customize this)
    dob { Faker::Date.between(from: 60.years.ago, to: 18.years.ago) }
    role { rand(0..2) } # Assuming 0, 1, 2 represent different user roles (customize as needed)
    created_at { Faker::Time.between(from: 2.years.ago, to: Time.now) }
    updated_at { Faker::Time.between(from: 2.years.ago, to: Time.now) }
  end
end