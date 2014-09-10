#-*- encoding: utf-8

require "./request/post.rb"
require "./request/artist.rb"
require "./request/pool.rb"
require "./request/tag.rb"
require "./request/tag_implication.rb"
require "./request/related_tag.rb"

require "./response/post.rb"

#require "./object/tag.rb"

puts DGrab::Post.listing().length