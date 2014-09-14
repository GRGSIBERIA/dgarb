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
require "./helper/get_image.rb"
require "./helper/mongo.rb"

require "optparse"

DEBUG = 1

def get_options
  args = {}
  OptionParser.new do |parser|
    parser.on('-c', '--config CONFIG_PATH', '設定ファイルのパス') {|v| args[:config] = v}
    parser.on('-d', '--dbpath DATABASE_PATH', 'データベースを置くディレクトリ') {|v| args[:dbpath] = v}
    parser.on('-i', '--imgpath IMAGE_PATH', '画像を置くディレクトリ') {|v| args[:imgpath] = v}
    parser.parse!(ARGV)
  end
  args
end

args = get_options

if DEBUG == 1 then
  #args[:config] = "J:\\Research\\dgrab\\config.yaml"
  #args[:imgpath] = "J:\\Research\\dgrab\\img"
  args[:config] = "G:\\data\\config.yaml"
  args[:imgpath] = "G:\\data\\img"
end

# 設定の読み込みをここで行う
#DGrab::Helper.import_config(args[:config])

# 画像の取得はこれ
#DGrab::Helper.get_image(tags: ["suzumiya_haruhi", "bunnysuit"], limit: 2, page: 0..1)

# JSONだけの取得はこれ(pageをRangeで指定する場合)
#responses = DGrab::Request::Post.listing(limit: 100, page: 0..9, tags: ["suzumiya_haruhi", "order:id"])

# JSONだけの取得はこれ(pageをIntegerで指定する場合)
#responses = DGrab::Request::Post.listing(limit: 10, page: 9, tags: ["suzumiya_haruhi", "order:id"])

# MongoDBを扱いたいときはこれ
#mongo = DGrab::Helper::Mongo.new

# 第3引数でDBに保存しておきたいパラメータを指定
#mongo.insert("posts", responses, [
#  :id, :created_at, :score,
#  :md5, :tag_string, :file_ext,
#  :tag_string_artist, :tag_string_copyright, :tag_string_character,
#  :fav_count, :large_file_url])

# MongoDBに追加されてるか確認を取る
#post = mongo.collection("posts")
#post.find.each { |r| puts r.inspect }