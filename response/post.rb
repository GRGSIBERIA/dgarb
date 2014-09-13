#-*- encoding: utf-8

require "./response/presenter.rb"
require "./response/object/file.rb"

module DGrab
  module Response

    class Post < Presenter
      def initialize(json)
        super(json)
      end

      # ポストのIDを返す
      # @return [Integer] ポストのID
      def id
        @json["id"]
      end

      # ポストの作成日を返す
      # @return [String] 作成日
      def created_at
        @json["created_at"]
      end

      # タグを返す
      # @param [Symbol] sym
      # @param [String] sym
      # @return [Hash]
      # @option [Array<String>] :all 全てのタグ
      # @option [Array<String>] :artist アーティストのタグ
      # @option [Array<String>] :character キャラクターのタグ
      # @option [Array<String>] :copyright 作品名のタグ
      # @option [Array<String>] :general 特殊でない普通のタグ
      def tags
        {
          :all => @json["tag_string"].split(" "),
          :artist => @json["tag_string_artist"].split(" "),
          :character => @json["tag_string_character"].split(" "),
          :copyright => @json["tag_string_copyright"].split(" "),
          :general => @json["tag_string_general"].split(" ")
        }
      end

      def file
        DGrab::Response::Object::File.new(json)
      end

      # お気に入り登録しているユーザIDを返す
      # @return [Array<Integer>] ユーザIDの配列
      def favorites
        @json["fav_string"].gsub("fav:", "").split(" ").map{|e| Integer e}
      end

      # お気に入りの数を返す
      # @return [Integer] お気に入りの数
      def fav_count
        @json["fav_count"]
      end

      # イラストを登録しているプールIDを返す
      # @return [Array<Integer>] プールIDの配列
      def pools
        @json["pool_string"].gsub("pool:", "").split(" ").map{|e| Integer e }
      end

      # 親ポストのIDを返す
      # @return [Integer] 親ポストのID
      def parent
        @json["parent_id"]
      end

      # 子ポストが存在するかどうか
      # @return [Boolean] 子ポストが存在するか
      def children?
        @json["has_children"]
      end

      # アクティブ？な子ポストが存在するかどうか
      # @return [Boolean] 子ポストが存在するか
      def active_children?
        @json["has_active_children"]
      end

      # 画像のPixivのイラストIDを返す
      # @return [Integer] PixivのイラストID
      # @note PixivのイラストのIDのこと．nullが戻ることもあり．
      def pixiv_id
        @json["pixiv_id"]
      end

      # ポストのスコアを返す
      # @return [Hash] スコアのハッシュ
      # @option [Integer] :all 全体のスコア
      # @option [Integer] :up イイネ
      # @option [Integer] :down ダメだね
      def score
        {
          :all => @json["score"],
          :up => @json["up_score"],
          :down => @json["down_score"]
        }
      end
    end

  end
end