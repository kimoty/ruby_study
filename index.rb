# -*- coding: utf-8 -*-
require 'rubygems'
require 'sinatra'
require 'sequel'
require 'dm-core'
require 'dm-migrations'

DataMapper::setup(:default, ENV['DATABASE_URL'] || 'sqlite3://#{Dir.pwd}/db.sqlite3')

class Todo
	include DataMapper::Resource
	property :id, Serial
	property :todo, Text
	auto_upgrade!
end



post '/todo' do
	Todo.create(:todo => params[:todo])
	redirect '/todo'
end

get '/todo' do
	@lists = Todo.all
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
