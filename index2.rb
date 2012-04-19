require 'sinatra'

class Con
  get '/todo' do
    @lists = ['a','b','c']
    erb :index
  end
end
#Con.run! #:host => 'localhost', :port => 9090
