class UpdateRides < ActiveRecord::Migration
  def change
    add_column :rides, :title, :string
    add_column :rides, :timespan, :string
    add_column :rides, :leave_on, :date
    
    remove_column :rides, :leave_at
    remove_column :rides, :return_at
  end
end
