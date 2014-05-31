class AddNeighborhoods < ActiveRecord::Migration
  def change
    Ride.delete_all
    add_column :rides, :neighborhood_id, :integer, null: false
    
    create_table :neighborhoods do |t|
      t.string :name, null: false
      t.string :slug, null: false
      
      t.timestamps
    end
    
    {
      avl_north: 'North AVL', 
      avl_south: 'S AVL (Arden/Fletcher)', 
      avl_east: 'East Asheville',
      avl_west: 'West Asheville',
      weaverville: 'Weaverville', 
      black_mountain: 'Black Mountain',
      swannanoa: 'Swannanoa',
      leicester: 'Leicester',
      enka_candler: 'Enka/Candler',
      barnardsville: 'Barnardsville'
    }.each do |slug, name|
      Neighborhood.create(name: name, slug: slug)
    end
  end
end
