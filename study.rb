# -*- coding: utf-8 -*-

require 'rubygems'
require 'sequel'

 def fact(n)
   if n == 0
     1
   else
     n * fact(n - 1)
   end
 end


 #print fact(ARGV[0].to_i), "\n"


 print "abc\n"
 puts '\n'

 var = "abc"

 print "111#{var}123\n"



 s = "hoge"

 s = s + " piyo"

 puts s


 puts "100".to_i
 puts "10km".to_i
 puts "100".to_i(2)

 puts 
 numbers = [1,2,3]
 puts numbers.find {|item| item % 2 == 0}



 user = {:name => "aaa", :mail => "a@a", :addr => "tokyo"}
 puts user[:name]


 class Foo

   @@piyo = 100
   attr_accessor :bar
   def initialize(value1,value2)
     @bar = value1
     @hoge = value2
   end

   def initialize(value1)
     @bar = value1
   end

   def show
     puts @bar
     puts @hoge
     puts @@piyo
   end

   def Foo.show
     puts @@piyo
   end
 end


 foo = Foo.new("testtest")
 foo.show
 puts foo.bar
 Foo.show



 open("foo.csv","a") { |f|
   f.puts 'eeeeeeeeeee'
 }


 open("foo.csv") { |line|

 @lists = []
 while l = line.gets
   @lists.push(l)
 end

 puts @lists
 }




 # connect to an in-memory database
 DB = Sequel.sqlite

 # create an items table
 DB.create_table :items do
   primary_key :id
   String :name
   Float :price
 end

 # create a dataset from the items table
 items = DB[:items]

 # populate the table
 items.insert(:name => 'abc', :price => rand * 100)
 items.insert(:name => 'def', :price => rand * 100)
 items.insert(:name => 'ghi', :price => rand * 100)

 # print out the number of records
 puts "Item count: #{items.count}"

 # print out the average price
 puts "The average price is: #{items.avg(:price)}"


items.each do |item|
 puts item[:name],item[:price]
end


puts items.all
