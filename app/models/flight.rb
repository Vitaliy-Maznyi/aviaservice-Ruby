class Flight < ActiveRecord::Base
  belongs_to :company
  belongs_to :plane
  has_many :orders, dependent: :delete_all

  attr_accessor :price

  validates_presence_of :number, :from, :destination, :departure, :arrival, :econom_price, :business_price, :plane_id, :company_id

  def self.find_company_name(company_name)
    joins(:company).where("companies.name = ?",company_name)
  end

  def available_business_tickets
    business_seats_total = self.plane.business_seats
    ordered_business_seats = self.orders.sum(:business_seats)
    return business_seats_total - ordered_business_seats
  end

  def available_econom_tickets
    econom_seats_total = self.plane.econom_seats
    ordered_econom_seats = self.orders.sum(:econom_seats)
    return econom_seats_total - ordered_econom_seats
  end

end



