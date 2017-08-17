require_relative 'game'
require 'json'
require 'sinatra'

get '/' do
  File.read('./public/index.html')
end

get '/start' do
  Game.start!
end

get '/api/board' do
  content_type :json

  Board.new.layout.to_json
end
