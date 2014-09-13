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
  args[:config] = "J:\\Research\\dgrab\\config.yaml"
  args[:dbpath] = "J:\\Research\\dgrab\\db"
  args[:imgpath] = "J:\\Research\\dgrab\\img"
end

# 設定の読み込みをここで行う
DGrab::Helper.import_config(args[:config])

# 画像の取得はこれ
#DGrab::Helper.get_image(tags: ["suzumiya_haruhi", "bunnysuit"], limit: 2, page: 0..1)

mongo = DGrab::Helper::Mongo.new
mongo.post