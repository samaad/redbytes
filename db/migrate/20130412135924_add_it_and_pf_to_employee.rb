class AddItAndPfToEmployee < ActiveRecord::Migration
  def change
    add_column :employees, :income_tax, :float
    add_column :employees, :providend_fund, :float
  end
end
