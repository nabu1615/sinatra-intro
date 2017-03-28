class Tag < ActiveRecord::Base
	has_many :entries_tags
	has_many :entries, :through => :entries_tags
	validates :name, :presence => true
end
