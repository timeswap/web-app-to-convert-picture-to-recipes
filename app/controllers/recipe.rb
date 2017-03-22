# display a list of all recipes
get '/recipes' do
  @recipes = Recipe.all
  erb :index
end

# create a new recipe
get '/recipes/new' do
  erb :'/recipes/new'
end

# register/create a new recipe
post '/recipes' do
  @recipe = Recipe.new(params[:recipe])
  if @recipe.save
    login
    redirect "/recipes/#{@recipe.id}"
  else
    erb :'/recipes/new'
  end
end

# display a specific recipe
get '/recipes/:id' do
  redirect '/' unless logged_in?
  @recipe = Recipe.find_by(id: params[:id])
  erb :'/recipes/show'
end

# Features to be added
# ===========================================

# return a form for editing a recipe
# get '/recipes/:id/edit' do
#   redirect '/' unless logged_in? && current_recipe.id == params[:recipe_id]
#   @recipe = recipe.find_by(id: params[:id])
#   erb :'/recipes/edit'
# end

# # update/edit a specific recipe
# put '/recipes/:id' do
#   @recipe = recipe.find_by(id: params[:id])
#   @recipe.assign_attributes(params[:recipe])
#   if @recipe.save
#     redirect '/recipes/#{@recipe.id}'
#   else
#     @errors = @recipe.errors.full_messages
#     erb :'/recipes/edit'
#   end
# end

# # delete a specific recipe
# delete '/recipes/:id' do
#   @recipe.destroy
#   redirect '/'
# end
