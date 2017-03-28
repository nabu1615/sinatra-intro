require 'faker'

20.times do |i|
  entry = Entry.create(title: Faker::Lorem.word, content: Faker::Lorem.sentence, image: Faker::Avatar.image)
  tags = []
  5.times do |tag|
    tag = Tag.create(name: Faker::Book.genre)
  	tags << tag.id
  end 
  entry.tag_ids = tags 
end

Tag.all.each do |tag|
  tag.entry_ids = Entry.all.pluck(:id).sample(5)
end
