require 'rubygems'
require 'sinatra'

get '/hello/:name' do
  "Hello #{params[:name]}\n"
end

get '/hello2/:name' do |n|
  "Hello #{n}\n"
end

get %r{/hello3/([\w]+)} do
  "Hello, #{params[:captures].first}!"
end

get '/say/*/to/*' do 
  params[:splat] # => ["hello", "world"]
end

class Stream
  def each
    100.times { |i| yield "#{i}\n" }
  end
end

get('/') { Stream.new }
