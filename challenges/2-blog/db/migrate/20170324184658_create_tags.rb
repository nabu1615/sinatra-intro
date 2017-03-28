class CreateTags < ActiveRecord::Migration
  def change
  	create_table :tags do |i|
  		i.string :name
  	end
  end
end
