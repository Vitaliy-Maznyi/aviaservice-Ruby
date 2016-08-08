FactoryGirl.define do
  factory :order do
    flight
    user
    econom_seats 9
    business_seats 9
    price 180
  end
end