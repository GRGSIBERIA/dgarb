#-*- encoding: utf-8

require "./request/const.rb"

require "yaml"
require "mechanize"
require "base64"

module DGrab

  module Helper

    # 設定ファイルクラス
    class Config
      attr_accessor :img_dir, :username

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

        if not @api_key.empty? and not @username.empty? then
          @auth = Base64.encode64("#{@username}:#{@api_key}") + "=="
          @auth.encode!("utf-8")
        end
        @auth ||= ""
      end

      def basic_auth
        "Basic #{@auth}"
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