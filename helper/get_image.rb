#-*- encoding: utf-8

require "./request/post.rb"
require "./response/post.rb"
require "./imaging/helper.rb"

require "./helper/config.rb"

module DGrab
  module Helper
    # 特定のタグから画像を取得する
    # @param [Hash] params その他のパラメータ，指定なしだとデフォルト
    # @option params [Array<String>] :tags タグの配列
    # @option params [Integer] :limit APIの1リクエストあたりで取得する数
    # @option params [Range] :page 取得するページ数
    # @option params [Array<String>] :options 検索クエリのオプション
    # @return [Array<DGrab::Response::Post>] 取得した結果を全て返す
    # @see params[:options]については，ここ参照（https://danbooru.donmai.us/wiki_pages/43049）
    def get_image(params={})
      directory = DGrab::Helper::CONFIG.img_dir
      limit = params[:limit]
      page = params[:page]
      tags = params[:tags]
      options = params[:options]

      # nilが入ってると困るのでしっかりパラメータをチェックする
      limit ||= 20
      page ||= 0..10
      options ||= []
      tags ||= []

      query = tags.join(" ") + options.join(" ")

      result_posts = []

      # ページごとにlimitの数だけ画像を取得する
      for page_num in page

        posts = DGrab::Request::Post.listing(page: page_num, limit: limit, tags: query)

        if posts.length == 0 then
          break   # 何も取得できなかったら脱出する
        end

        result_buffer = []

        for post in posts
          path = post.file.download(directory)

          # 無効なパスが投げられている場合は回避する
          if not path.nil? then
            jpg_path, convert_flag = DGrab::Image.convert(path)
            DGrab::Image.append_tags(jpg_path, post.tags[:all])
            result_buffer << post
          end
        end

        result_posts += result_buffer
      end
      result_posts
    end

    module_function :get_image
  end
end