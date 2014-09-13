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

      def collection(collection_name)
        @db.collection(collection_name)
      end

      def insert(collection_name, objects, include_params)
        collection = @db.collection(collection_name)

        for obj in objects
          insert_item = {}
          json = obj
          for inc in include_params
            insert_item[inc] = json[inc]
          end
          collection.insert(insert_item)
        end
      end

      attr_reader :db
    end
  end
end