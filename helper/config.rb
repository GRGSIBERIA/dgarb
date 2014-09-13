#-*- encoding: utf-8

require "yaml"

module DGrab

  module Helper

    class Config
      attr_accessor :db_path, :img_path, :username, :password

      def initialize()

      end

      def init(yaml)
        @db_path = yaml[:db_path]
        @img_path = yaml[:img_path]
        @username = yaml[:username]
        @password = yaml[:password]
      end

      def Config.init(yaml_path)
        yaml = YAML.load_file(yaml_path)

        CONFIG.init(yaml)
      end


    end

    CONFIG = Config.new

    # コンフィグを読み込む
    def import_config(path=nil)
      path ||= "./config.yaml"
      if not File.exist?(path) then
        return false
      end

      Config.init(path)
    end

    module_function :import_config
  end

end