#-*- encoding: utf-8

module DGrab
  module Response

    # レスポンスを受け取り，インスタンス作成するクラス
    class Presenter
      def initialize(json)
        @json = json
      end

    end

  end
end