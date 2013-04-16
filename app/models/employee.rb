class Employee < ActiveRecord::Base
  attr_accessible :age, :full_name, :salary, :income_tax, :calculate_pf, :designation

  before_create :calculate_income_tax, :calculate_pf

  validates :salary, numericality: true
  validates :salary, presence: true
  validates :age, presence: true
  validates :age, numericality: true
  validate :validate_salary_for_desgination
  private  
   
  def calculate_income_tax
    self.income_tax = 10/self.salary * 100
    return true
  end   
  def calculate_pf
    self.providend_fund = 0.5/self.salary * 100
    return true
  end 
  
  def validate_salary_for_desgination
  if self.designation == "Executive" && self.salary > 25000
    errors.add(:salary, "can't be more then 25,000 for an executive")
  elsif self.designation == "Manager" && self.salary < 30000
    errors.add(:salary, "can't be less then 20,000 for a manager")
  end
  end
  
end

