class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!


  # create ----------------------------------

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/new' do
    erb :new #show new recipes view
  end

  post '/recipes' do
    inst = Recipe.create(params)
    redirect "/recipes/#{inst.id}"
  end
  # READ ----------------------------

  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    # binding.pry
    erb :show
  end

  # UPDATE -------------------------

  get '/recipes/:id/edit' do
    # binding.pry
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    # binding.pry
    @inst = Recipe.find(params[:id])
    @inst.update(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect "recipes/#{@inst.id}"
  end

  # DESTROY -------------------------

  delete "/recipes/:id" do
    Recipe.delete(params[:id])
    redirect "/recipes"
  end

end
