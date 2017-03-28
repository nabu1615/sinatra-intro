class CreateEntries < ActiveRecord::Migration
  def change
  	create_table :entries do |i|
  		i.string :title
  		i.text :content
  		i.string :image

  		i.timestamps
  	end
  end
end
