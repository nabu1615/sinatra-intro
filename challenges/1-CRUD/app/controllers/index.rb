# Index
get '/' do
  @notes = Note.all
  erb :index
end

#New
get '/notes/new' do
	erb :new
end

def find_note(id)
	@note = Note.find_by(id: id)
end

# Show
get '/notes/:id' do
  @note = find_note(params[:id])
  erb :show
end

# Create
post '/notes' do
	@note = Note.new(title: params[:title], content: params[:content])
	if @note.save
		redirect "notes/#{@note.id}"
	else
		@errors = @note.errors.full_messages
		erb :new
	end
end

# Edit
get '/notes/:id/edit' do
	@note = find_note(params[:id])
	erb :edit
end

#Update

patch '/notes/:id' do
	note = find_note(params[:id])
	note.update(title: params[:title], content: params[:content])
	redirect "/notes/#{params[:id]}"
end

#Delete

get '/notes/:id/delete' do
	note = find_note(params[:id])
	note.destroy
	redirect "/"
end

