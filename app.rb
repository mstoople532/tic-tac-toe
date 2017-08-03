require_relative 'game'
require 'sinatra'

get '/' do
  File.read('./public/index.html')
end

get '/start' do
  Game.start!
end
