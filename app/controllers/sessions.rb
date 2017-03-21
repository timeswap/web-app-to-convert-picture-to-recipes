get '/sessions/login' do
	erb :'sessions/new'
end

post '/login' do
	@user = User.authenticate(params[:user][:email], params[:user][:password])
	if validation_fail
		erb :'/sessions/new'
	elsif @user
		login
		redirect "/users/#{@user.id}"
	end
end

delete '/logout' do
	logout
	redirect '/'
end


# different routes where you don't need login

# login form
get '/sessions' do
	erb :'/sessions/new'
end

# login action
post '/sessions' do
	@user = User.find_by(email: params[:email])
	if @user && @user.password == params[:password]
		session[:id] = @user.id
		redirect '/users'
	else
		
	end

end

#logout action
delete '/sessions' do
	session[:id] = nil
	redirect '/'
end