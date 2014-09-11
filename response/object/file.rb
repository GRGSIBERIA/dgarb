#-*- encoding: utf-8

require "./response/object/instance.rb"

module DGrab
  module Response
    module Object
      class File < Instance
        def initialize(json)
          keys = {
            ext: "file_ext",
            size: "file_size",
            url: "file_url",
            has_large: "has_large",
            id: "id",
            height: "image_height",
            width: "image_width",
            is_deleted: "is_deleted",
            large_url: "large_file_url",
            md5: "md5",
            preview_url: "preview_file_url",
            source: "source",
            created_at: "created_at"
          }
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
end