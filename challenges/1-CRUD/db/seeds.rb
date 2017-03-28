require 'faker'

20.times do |i|
  Note.create(title: Faker::Lorem.word, content: Faker::Lorem.sentence)
end