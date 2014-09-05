#-*- encoding: utf-8
require "./post.rb"

post = DW::Post.new

puts post.get(limit: 5)