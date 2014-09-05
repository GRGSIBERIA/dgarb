#-*- encoding: utf-8
require "./post.rb"
require "./artist.rb"

post = DW::Artist.new

puts post.listing(limit: 10, search_is_banned: true)