#-*- encoding: utf-8

module DW
  module Download
    # 指定したIDのポストを取得
    # @param [Integer] id_or_md5 ポストのID
    # @param [String] id_or_md5 MD5の文字列
    # @return [String] 取得したファイルのパス
    def post(param={})

    end

    # 指定した名前かIDのアーティストのポストを取得
    # @param [String] id_or_name Artistの名前
    # @param [Integer] id_or_name ArtistのID
    # @return [Array<String>] 取得したファイルのパスの配列
    def artist(param={})

    end

    # 指定したタグのポストを取得
    # @return [Array<String>] 取得したファイルのパスの配列
    def tag(param={})

    end
  end
end