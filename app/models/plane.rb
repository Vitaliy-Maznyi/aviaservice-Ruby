class Plane < ActiveRecord::Base
  belongs_to :company
  has_many :flights

  def self.find_company_name(company_name)
    joins(:company).where("companies.name = ?", company_name)
  end
end
