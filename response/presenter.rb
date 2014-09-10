#-*- encoding: utf-8

module DGrab
  module Response

    # レスポンスを受け取り，インスタンス作成するクラス
    class Presenter
      def initialize(json, instance_class)
        @json = json
        @instance_class
      end

      # レスポンスの最初の要素を得る
      # @param [Class] instance_class 対象のクラス型
      # @return [Class] instance_classと同じ型のオブジェクト
      def first
        instance_class.new(@json.first)
      end

      # レスポンスの最後の要素を得る
      # @param [Class] instance_class 対象のクラス型
      # @return [Class] instance_classと同じ型のオブジェクト
      def last
        instance_class.new(@json.last)
      end

      # レスポンスを得る
      # @param [Class] instance_class 対象のクラス型
      # @param [Integer] i 添字
      # @return [Class] instance_classと同じ型のオブジェクト
      def get
        instance_class.new(@json[i])
      end

      # レスポンスの長さを得る
      # @return [Integer] レスポンスの長さ
      def length
        @json.length
      end

    end

  end
end