class Company < ActiveRecord::Base
  belongs_to :user
  has_many :flights
  has_many :orders, through: :flights

  validates_presence_of :name, :country
end
