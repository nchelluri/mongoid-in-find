#!/usr/bin/env ruby

require 'bundler'
require 'mongoid'

Bundler.require

puts "Mongoid Version: #{Mongoid::VERSION}\n\n"

Mongoid.load!('mongoid.yml', :development)

class MyModel
  include Mongoid::Document
end

ids = (1..3).map do
  m = MyModel.create()
  m.id
end

look_in_ids = ids[0..-2]

puts "Created documents with IDs #{ids}"
puts "Looking In IDs #{look_in_ids} and then calling #find"

puts "Find Result: #{MyModel.in(:id => look_in_ids).find(ids.last).id}"
