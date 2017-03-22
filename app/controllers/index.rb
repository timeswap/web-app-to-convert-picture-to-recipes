get '/' do
  # Look in app/views/index.erb
  @recipes = Recipe.all
  erb :index
end
