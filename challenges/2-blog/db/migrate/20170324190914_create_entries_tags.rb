class CreateEntriesTags < ActiveRecord::Migration
  def change
  	create_table :entries_tags do |i|
  		i.integer :tag_id
  		i.integer :entry_id

  		i.timestamps
  	end
  end
end
