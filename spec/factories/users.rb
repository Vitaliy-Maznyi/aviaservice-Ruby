FactoryGirl.define do
  factory :user do
    sequence(:name) {|i| "userN#{i}"}
    sequence(:email) {|i| "email#{i}@email.com"}
    password "password"
    password_confirmation "password"

    factory :admin do
      admin true
    end
  end
end