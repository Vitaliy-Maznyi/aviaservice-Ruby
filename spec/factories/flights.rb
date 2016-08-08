FactoryGirl.define do
  factory :flight do
    company
    plane
    sequence(:number) {|i| "flight#{i}"}
    from "Kiev"
    destination "London"
    departure "2016-08-25 10:00:00"
    arrival "2016-08-25 13:30:00"
    econom_price 45
    business_price 90
  end
end