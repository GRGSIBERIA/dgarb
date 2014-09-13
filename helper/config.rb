#-*- encoding: utf-8

require "yaml"

module DGrab

  module Helper

    # 設定ファイルクラス
    class Config
      attr_accessor :db_dir, :img_dir, :username, :password

      def initialize()

      end

      def init(yaml)
        @db_dir = yaml[:db_dir]
        @img_dir = yaml[:img_dir]
        @username = yaml[:username]
        @password = yaml[:password]
        @provider = yaml[:provider]
        @db_dir ||= "./"
        @img_dir ||= "./img"
        @password ||= ""
        @username ||= ""
        @provider ||= "Danbooru"

        if not @username.empty? and not @password.empty? then
          # ここで一度Providerでログイン処理する
          if @provider == "Danbooru" then

          end
        end
      end

      def Config.init(yaml_path)
        yaml = YAML.load_file(yaml_path)

        CONFIG.init(yaml)
      end
    end

    # 設定重要なのでグローバルに
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