#-*- encoding: utf-8

require "./request/const.rb"

require "yaml"
require "pp"

module DGrab

  module Helper

    # 設定ファイルクラス
    class Config
      attr_accessor :db_dir, :img_dir, :username, :password

      def initialize()

      end

      def init(yaml_path)
        f = File.open(yaml_path, "r")
        yaml = YAML.load(f)

        @db_dir = yaml["db_dir"]
        @img_dir = yaml["img_dir"]
        @username = yaml["username"].to_s
        @password = yaml["password"].to_s
        @provider = yaml["provider"]
        @db_dir ||= "./"
        @img_dir ||= "./img"
        @password ||= ""
        @username ||= ""
        @provider ||= "Danbooru"

        if not @username.empty? and not @password.empty? then
          # ここで一度Providerでログイン処理する
          if @provider == "Danbooru" then
            page = DGrab::Request::AGENT.get("https://danbooru.donmai.us/session/new")
            result = page.form_with(:class => "simple_form") {|form|
              form.name = @username.toutf8
              form.password = @password.toutf8
              puts form.name, form.password
            }.submit

            if result.body.include?("Password was incorrect.") then
              raise ArgumentError, "ログインに失敗しました"
            end
          end
        end
      end

      def Config.init(yaml_path)
        CONFIG.init(yaml_path)
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