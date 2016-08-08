FactoryGirl.define do
  factory :plane do
    company
    sequence(:number) {|i| "plane#{i}"}
    econom_seats 40
    business_seats 30
  end
end