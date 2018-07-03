require 'sinatra'

get '/' do
 'Hello World!'
end

get '/alice' do
 'Hello World!'
end

get '/:name' do
 "Hello #{params[:name]}"
end

get '/' do
 'matched root'
end

get '/name' do
 'matched name'
end

get '/:age' do
 'matched age'
end
