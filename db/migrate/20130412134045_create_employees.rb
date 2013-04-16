class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :full_name
      t.integer :age
      t.float :salary

      t.timestamps
    end
  end
end
