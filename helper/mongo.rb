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

        @post = @db.collection('posts')
      end

      attr_reader :db, :post
    end
  end
end