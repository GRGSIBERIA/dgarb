#-*- encoding: utf-8

module DGrab
  module Response

    # レスポンス受け取りからインスタンス作成
    class Adapter
      def initialize(json)
        @json = json
      end

      def first(cls)
        cls.new(@json.first)
      end

      def last(cls)
        cls.new(@json.first)
      end

      def get(cls, i)
        cls.new(@json[i])
      end

    end

  end
end