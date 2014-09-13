#-*- encoding: utf-8

require "./imaging/helper.rb"

require "./request/post.rb"
require "./request/artist.rb"
require "./request/pool.rb"
require "./request/tag.rb"
require "./request/tag_implication.rb"
require "./request/related_tag.rb"

require "./response/post.rb"
require "./response/artist.rb"
require "./response/pool.rb"
require "./response/tag.rb"
require "./response/tag_implication.rb"
require "./response/related_tag.rb"

require "./response/object/file.rb"

require "./helper/config.rb"
require "./helper/get.rb"

#
DGrab::Helper.import_config

#DGrab::Helper.get("J:\\Research\\dgrab\\img", tags: ["suzumiya_haruhi", "bunnysuit"], limit: 10, page: 0..1).each {|post|
#  puts post.tags[:character]
#}



