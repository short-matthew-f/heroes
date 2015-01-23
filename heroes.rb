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
  Pry.start(binding)
end

get '/heroes/:name' do # show me a hero (show)
  @hero = Hero.find_by_name( params[:name] )

  erb :"heroes/show"
end

get '/weapons' do # list all weapons (index)

end

get '/weapons/new' do # show form for new weapons (new)

end

post '/weapons' do  # create a weapon (create)

end
