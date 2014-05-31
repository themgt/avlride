class InitialSetup < ActiveRecord::Migration
  def change
    add_column :users, :lat_home, :float
    add_column :users, :lon_home, :float
    add_column :users, :lat_work, :float
    add_column :users, :lon_work, :float
    add_column :users, :have_car, :boolean
    
    create_table :rides do |t|
      t.belongs_to :user, null: false
      
      t.float :lat_a
      t.float :lon_a
      t.float :lat_b
      t.float :lon_b
      t.datetime :leave_at
      t.datetime :return_at
      t.boolean :has_car
      t.text :message
      t.boolean :active
      
      t.timestamps
    end
    
    create_table :ride_offer do |t|
      t.belongs_to :user, null: false
      t.belongs_to :ride, null: false
      t.text :message, null: false
      t.boolean :accepted
      
      t.timestamps
    end
    
    create_table :reviews do |t|
      t.belongs_to :user, null: false
      t.belongs_to :ride, null: false
      t.string :overall, null: false
      
      t.timestamps
    end
  end
end
