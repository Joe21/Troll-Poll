class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
    	t.string :name
    	t.string :title
    	t.string :image
    	t.integer :votes

      t.timestamps
    end
  end
end
