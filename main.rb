require 'sinatra'

get '/' do
  send_file 'index.html'
end

get '/example.png' do
  send_file 'example.png'
end

post '/click' do
  system("xdotool key --delay 200 #{params[:key]}")
end
