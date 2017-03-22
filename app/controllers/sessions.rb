get '/sessions/login' do
	erb :'sessions/new'
end

post '/login' do
  @user = User.find_by(email: params[:user][:email])
  if @user && @user.password == params[:user][:password]
  	p "login here"
		p "*" * 50
    login
    redirect "/users/#{@user.id}"
  else
    @errors = ['Username or Password Incorrect!']
    erb :'sessions/new'
  end
end

delete '/logout' do
	p "logout here"
	p "*" * 50
	logout
	redirect '/'
end

