FactoryGirl.define do
  factory :company do
    user
    sequence(:name) {|i| "Air#{i}"}
    country "Ukraine"
  end
end