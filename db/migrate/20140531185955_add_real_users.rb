class AddRealUsers < ActiveRecord::Migration
  def change
    add_column :users, :home_neighborhood_id, :integer
    add_column :users, :work_neighborhood_id, :integer
    
    rename_table :ride_offer, :ride_offers
  end
end
