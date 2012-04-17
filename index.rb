# -*- coding: utf-8 -*-
require 'rubygems'
require 'sinatra'
require 'sequel'

DB = Sequel.sqlite

DB.create_table :todo do
  primary_key :id
  String :todo
  #Date :date
end


post '/todo' do
  todo = DB[:todo]
  #todo.insert(:todo => params[:todo])
todo.insert(:todo => 'abc')
# @todo = params[:todo]
#  open("foo.csv","a") { |f|
#    f.puts @todo
#  }
  redirect '/todo'
end

# @lists = ['aaaa','bbbb','cccc']
get '/todo' do

# @lists = []
# open("foo.csv") {|file|
#  while l = file.gets
#    @lists.push(l)
#  end
# }

  @lists = DB[:todo]

  erb :index 
end


helpers do
  include Rack::Utils; alias_method :h, :escape_html
end

template :layout do
  "<html><body><h1>Hello World</h1><%= yield %></body></html>"
end

get '/' do
  erb %{
aaaaaaaaa
    <p>あなたの名前は？</p>
    <form action='/hello' method='POST'>
    <input type='text' name='name'>
    <input type='submit' value='送信'>
    </form>
  }
end

post '/hello' do
  erb %{
    <p>こんにちは，<%= params[:name] %>さん！</p>
    <a href='/'>戻る</a>
  }
end

not_found do
  'ファイルが存在しません'
end
