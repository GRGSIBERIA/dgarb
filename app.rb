require "./post.rb"

post = DW::Post.new

puts post.Get().search("article.post-preview").length