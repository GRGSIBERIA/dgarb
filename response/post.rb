#-*- encoding: utf-8

require "./response/presenter.rb"

module DGrab
  module Response

    class Post < Presenter
      def initialize(json)
        super(json)
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
    end

  end
end