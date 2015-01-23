require 'sinatra'
require 'sinatra/reloader'
require 'csv'
require 'pry'

require_relative 'classes/hero'
require_relative 'classes/weapon'

# ROUTES

get '/heroes' do # list all heroes (index)
  @heroes = Hero.all
  erb :"heroes/index"
end

get '/heroes/new' do # show form for new heroes (new)
  erb :"heroes/new"
end

post '/heroes' do # create a hero (create)
  hero = Hero.create( params[:hero] )

  redirect to("heroes/#{hero.name}")
end

get '/heroes/:name' do # show me a hero (show)
  @hero = Hero.find_by_name( params[:name] )

  if @hero
    erb :"heroes/show"
  else
    "No hero by that name exists!"
  end
end

get '/weapons' do # list all weapons (index)

end

get '/weapons/new' do # show form for new weapons (new)

end

post '/weapons' do  # create a weapon (create)

end
