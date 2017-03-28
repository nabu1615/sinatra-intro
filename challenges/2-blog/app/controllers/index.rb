get '/' do
  @entries = Entry.all
  erb :index
end

def find_entry(id)
	@entry = Entry.find_by(id: id)
end

def find_tag(id)
	@tag = Tag.find_by(id: id)
end

# New
get '/entries/new' do
	erb :'entries/new'
end

# Show
get '/entries/:id' do
	@entry = find_entry(params[:id])
	erb :entries
end

# Create

post '/entries' do
	@filename = params[:image][:filename]
	file = params[:image][:tempfile]

	tags = params[:tags].split(',')

	File.open("./public/#{@filename}", 'wb') do |f|
		f.write(file.read)
	end
	@entry = Entry.new(title: params[:title], content: params[:content], image: file)
	
	tags.each do |tag|
		tag = tag.capitalize
		tag_find = Tag.find_by(name: tag)

		if tag_find.name
			tag_find.entry_ids << @entry[:id]
		else
			n_tag = Tag.create(title: tag)
			n.save
		end
	end

	if @entry.save
		redirect "entries/#{@entry.id}"
	else
		@errors = @note.errors.full_messages
		erb :'entries/new'
	end
end

#Show Tags
get '/tags/:id' do
	@tags = find_tag(params[:id])
	erb :tags
end

# Edit Entry
get '/entries/:id/edit' do
	erb :'entries/edit'
end