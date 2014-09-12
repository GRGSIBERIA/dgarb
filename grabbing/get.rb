#-*- encoding: utf-8

require "./request/post.rb"
require "./response/post.rb"
require "./imaging/helper.rb"

module DGrab
  module Grabbing
    # 特定のタグから画像を取得する
    # @param [String] directory 保存するフォルダ名
    # @param [Array<String>] tags タグの配列
    # @param [Hash] params その他のパラメータ，指定なしだとデフォルト
    # @option params [Integer] :limit APIの1リクエストあたりで取得する数
    # @option params [Range] :page 取得するページ数
    # @option params [Array<String>] :options 検索クエリのオプション
    # @return [Array<DGrab::Response::Post>] 取得した結果を全て返す
    # @see params[:options]については，ここ参照（https://danbooru.donmai.us/wiki_pages/43049）
    def get(directory, tags, params={})
      limit = params[:limit]
      page = params[:page]
      options = params[:options]
      query = tags.join(" ") + options.join(" ")

      result_posts = []

      for page_num in page 

        posts = DGrab::Post.listing(page: page_num, limit: limit, tags: query)

        if posts.length == 0 then
          break   # 何も取得できなかったら脱出する
        end

        for post in posts
          path = post.file.download(directory)
          jpg_path, convert_flag = DGrab::Imaging.convert(path)
          DGrab::post.append_tags(jpg_path, post.tags[:all])
        end

        result_posts += posts
      end
      result_posts
    end
  end
end