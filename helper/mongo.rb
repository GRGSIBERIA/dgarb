#-*- encoding: utf-8

require "mongo"

require "./helper/config.rb"

module DGrab
  module Helper
    # MongoDBのヘルパークラス
    class Mongo

      # @param [String] mongo_server MongoDBの接続先サーバ
      def initialize(mongo_server="localhost")
        @connection = ::Mongo::Connection.new(mongo_server)
        @db = @connection.db("dgrab")
      end

      # コレクションを取得
      # @param [String] collection_name コレクション名
      def collection(collection_name)
        @db.collection(collection_name)
      end

      # レコードを一度に挿入する
      # @param [String] collection_name コレクション名
      # @param [Array<DGrab::Response::Presenter>] 結果の配列
      # @param [Array<Symbol>] JSONでレコードに保存しておきたいパラメータ名
      # @return [Integer] 実際にinsertされたレコード数
      def insert(collection_name, objects, include_params)
        collection = @db.collection(collection_name)

        record_count = 0
        for obj in objects
          insert_item = {}

          if obj.success? then
            for incparam in include_params
              insert_item[incparam] = obj[incparam]
            end
            collection.insert(insert_item)
            record_count += 1
          end
        end
        record_count
      end

      attr_reader :db
    end
  end
end