#-*- encoding: utf-8

require "./request/const.rb"

require "yaml"
require "mechanize"
require "bcrypt"

module DGrab

  module Helper

    # 設定ファイルクラス
    class Config
      attr_reader :img_dir, :username, :authorize, :api_key

      def initialize()

      end

      def init(yaml_path)
        f = File.open(yaml_path, "r")
        yaml = YAML.load(f)

        @img_dir = yaml["img_dir"]
        @provider = yaml["provider"]
        @api_key = yaml["api_key"]
        @username = yaml["username"]

        @img_dir ||= "./img"
        @provider ||= "Danbooru"
        @api_key ||= ""
        @username ||= ""
        @authorize = false
        if @api_key != "" then
          @authorize = true
          @api_key = BCrypt::Password.create(@api_key)
        end
      end

      def Config.init(yaml_path)
        CONFIG.init(yaml_path)
      end

    end

    # 設定重要なのでグローバルに
    CONFIG = Config.new

    # コンフィグを読み込む
    # @param [String] path 設定のYAMLファイルのパス
    # @return [DGrab::Helper::Config] コンフィグのインスタンス
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