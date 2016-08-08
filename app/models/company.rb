class Company < ActiveRecord::Base
  belongs_to :user
  has_many :flights
  has_many :orders, through: :flights
end
