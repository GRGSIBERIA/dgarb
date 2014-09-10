#-*- encoding: utf-8

require "./response/object/instance.rb"

module DGrab
  module Response

    class File < Instance
      def initialize(json)
        keys = [
          "file_ext",
          "file_size",
          "file_url",
          "has_large",
          "id",
          "image_height",
          "image_width",
          "is_deleted",
          "large_file_url",
          "md5",
          "preview_file_url",
          "source",
          "created_at"
        ]
        super(json, keys)
      end

      # 画像を取得する
      # @param [String] directory 保存先のディレクトリ
      # @param [Symbol] type 取得する画像の種類(:large, :preview, :source)，デフォルトは:large
      # @note :sourceの場合，存在しないこともあるため注意
      def download(directory, type=:large)
        if type == :large then

        elsif type == :preview then

        elsif type == :source then

        end
      end
    end

  end
end