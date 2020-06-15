class RecipeController < ApplicationController
require 'pry'
  get "/recipes" do
    @recipes = Recipe.all
    erb :index
  end

  post "/recipes" do
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  get "/recipes/new" do
    erb :new
  end
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    recipe_params = params[:recipe]
    @recipe = Recipe.find(recipe_params[:id])
    @recipe.update(recipe_params)
    redirect to "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect to "/recipes"
  end
end
