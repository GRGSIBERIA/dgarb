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
            created_at: "created_at",
            tags: "tag_string"
          }
          super(json, keys)
        end

        # 画像を取得する
        # @param [String] directory 保存先のディレクトリ
        # @param [Symbol] type 取得する画像の種類(:large, :preview, :source)，デフォルトは:large
        # @param [String] prefix 保存するときにつける接頭辞
        # @note :sourceの場合，存在しないこともあるため注意
        def download(directory, type=:large, prefix="dgrab_")
          uri = DGrab::DANBOORU_URL
          fname = "dgrab_#{@md5}.#{@ext}"
          
          # ディレクトリの後ろにスラッシュを挟む
          if directory.include?("/") then
            if directory[-1] != "/" then
              directory += "/"
            end
          elsif directory.include?("\\") then
            if directory[-1] != "\\" then
              directory += "\\"
            end
          end

          save_as = lambda { |path, url| 
            ::File.open(path, "wb") { |f|
              f.write(DGrab::AGENT.get(url).body)
              f.close
            }
          }

          path = directory + fname
          if type == :large then
            save_as.call(path, uri + @large_url[1..-1])
            #DGrab::AGENT.get(uri + @large_url[1..-1]).save_as(path)
          elsif type == :preview then
            #DGrab::AGENT.get(uri + @preview_url[1..-1]).save_as(path)
            save_as.call(path, uri + @preview_url[1..-1])
          elsif type == :source then
            #DGrab::AGENT.get(@source).save_as(path)
            save_as.call(path, @source)
          end
          path
        end
      end
    end
  end
end