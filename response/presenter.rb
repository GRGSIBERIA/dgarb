#-*- encoding: utf-8

module DGrab
  module Response

    # レスポンスを受け取り，その結果を管理するためのクラス
    class Presenter
      def initialize(json)
        @json = json
      end

      # jsonメソッドの糖衣構文
      # @return [Hash] JSONオブジェクト
      def [](sym)
        @json[sym.to_s]
      end

      # JSONオブジェクトを返す
      # @return [Hash] JSONオブジェクト
      def json
        @json
      end

      # レスポンスのIDを返す
      # @return [Integer] レスポンスのID
      def id
        @json["id"]
      end

      def created_at
        @json["created_at"]
      end

    end

  end
end