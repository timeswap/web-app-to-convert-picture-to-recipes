# display a list of all users
get '/users' do
	@users = User.all
	erb :index
end

# create a new user
get '/users/new' do
	erb :'/users/new'
end

# register/create a new user
post '/users' do
	@user = User.new(params[:user])
	if @user.save
		login
		redirect "/users/#{@user.id}"
	else
		erb :'/users/new'
	end
end

# display a specific user
get '/users/:id' do
	@user = User.find_by(id: params[:id])
	erb :'/users/show'
end

# ===========================================

# return a form for editing a user
get '/users/:id/edit' do
	@user = User.find_by(id: params[:id])
	erb :'/users/edit'
end

# update a specific user
put '/users/:id' do
	@user = User.find_by(id: params[:id])
	@user.assign_attributes(params[:user])
	if @user.save
		redirect '/users'
	else
		erb :'/users/edit'
	end
end

# delete a specific user
delete '/users/:id' do
	@user.destroy
	redirect '/'
end
