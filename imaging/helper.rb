#-*- encoding: utf-8

require "rmagick"

module DGrab
  
  # 画像関係のヘルパー関数
  module Image

    # 読み込んだファイルをJPEGに変換する
    # @param [String] filepath JPEG以外のファイルのパス
    # @return [String] 新しく生成されたパス
    # @note JPEGが投げられた場合，JPEGのパスを返す
    def convert(filepath)
      if not File::exist?(filepath) then
        raise IOError, "Don't exist file: #{filepath}"
      end

      path, fname = File::split(filepath)
      ext = File::extname(fname).downcase

      if ext == ".png" or ext == ".gif" then
        new_path = filepath

        begin
          image = Magick::Image.read(filepath).first
        rescue
          return nil
        end

        basename = File::basename(fname, ext)
        new_path = path + "\\" + basename + ".jpg"
        image.write(new_path)
      end

      return new_path
    end

    # 指定したパスのJPEGファイルにタグを追加する
    # @param [String] path ファイルのパス
    # @param [String] tags カンマ区切りで書かれたタグの文字列
    # @param [Array<String>] tags タグの配列
    # @note 日本語にも対応
    def append_tags(path, tags)
      if not File::exist?(filepath) then
        raise IOError, "Don't exist file: #{filepath}"
      end

      path, fname = File::split(filepath)
      ext = File::extname(fname).downcase

      if ext != ".jpg" or ext != ".jpeg" then
        raise IOError, "Don't match extension of JPEG: #{path}"
      end

      if tags.class == Array then
        total_tags = tags.join(", ")
      elsif tags.class == String then
        total_tags = tags
      end

      result = system("exiftool #{path} -Keywords=\"#{total_tags}\"")

      if not result then
        puts "Failed Append Tags: #{total_tags}"
      end
      return result
    end

    module_function :append_tags
    module_function :convert
  end
end
