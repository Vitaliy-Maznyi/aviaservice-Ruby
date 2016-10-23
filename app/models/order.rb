class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :flight

  validate :tickets_count

  def self.find_company_name(company_name)
    joins(flight: :company).where("companies.name = ?", company_name)
  end

  ransacker :price do
    Arel.sql("to_char(price, '9999999')")
  end

  private
  def tickets_count
    if flight.available_business_tickets < self.business_seats
      errors.add(:base, 'No free business tickets')
    elsif flight.available_econom_tickets < self.econom_seats
      errors.add(:base, 'No free econom tickets')
    else
      true
    end
  end

end