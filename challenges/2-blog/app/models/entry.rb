class Entry < ActiveRecord::Base
  has_many :entries_tags
  has_many :tags, :through => :entries_tags
  validates :title, :content, :image, :presence => true
end
