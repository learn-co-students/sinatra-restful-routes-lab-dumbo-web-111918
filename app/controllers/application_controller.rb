class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
  end


  get "/recipes" do
    @recipes = Recipe.all
    erb :index
  end

  get "/recipes/new" do

    erb :new

  end

  post "/recipes" do
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect to "/recipes/#{@recipe.id}"
#binding.pry
  end

  get "/recipes/:id" do
find_recipe
erb :show

  end

  get "/recipes/:id/edit" do
    find_recipe
    erb :edit

  end

  patch "/recipes/:id" do
    #binding.pry
    @recipe = Recipe.find(params[:id])
    @recipe.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])

    redirect to "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id' do
    #binding.pry
find_recipe
@recipe.destroy
redirect to "/recipes"
  end


  def find_recipe
    @recipe = Recipe.find(params[:id])
    #binding.pry

  end
end
