#-*- encoding: utf-8

require "mongo"
require "open3"

module DGrab
  module Helper
    # MongoDBのヘルパークラス
    class Mongo
      def initialize(db_dir)
        if @@wait_thread == nil then
          @stdin, @stdout, @stderr, @wait_thread = Open3.popen3("mongod --dbpath \"#{db_dir}\"")
          @@wait_thread = @wait_thread
          puts "start mongod"

          ObjectSpace.define_finalizer(self, self.class.cleanup)
        end
      end

      def self.cleanup
        @@wait_thread.value.exitstatus
        puts "shutdown mongod"
      end
    end
  end
end