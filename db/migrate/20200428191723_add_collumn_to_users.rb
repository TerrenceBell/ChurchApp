class AddCollumnToUsers < ActiveRecord::Migration
  def change
      add_column :users, :church_home, :string
      add_column :users, :favorite_scripture, :string 
  end
end
