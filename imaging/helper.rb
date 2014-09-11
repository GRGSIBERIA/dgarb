#-*- encoding: utf-8

require "rmagick"

module DGrab
  
  # 画像関係のヘルパー関数
  module Image

    # 読み込んだファイルをJPEGに変換する
    # @param [String] filepath JPEG以外のファイルのパス
    # @return [Array<String, Boolean>] 新しく生成されたパスと変換の可否を返す
    # @note JPEGが投げられた場合はJPEGのパスを返す．何らかの異常があるとnilが返る．
    def convert(filepath)
      if not File::exist?(filepath) then
        raise IOError, "Don't exist file: #{filepath}"
      end

      directory, fname = File::split(filepath)
      ext = File::extname(fname).downcase
      new_path = filepath
      converted_flag = false

      if ext == ".png" or ext == ".gif" then
        
        begin
          image = Magick::Image.read(filepath).first
        rescue
          return nil
        end

        basename = File::basename(fname, ext)
        new_path = directory + "\\" + basename + ".jpg"
        image.write(new_path)
        converted_flag = true
      end

      return new_path, converted_flag
    end

    # 指定したパスのJPEGファイルにタグを追加する
    # @param [String] filepath ファイルのパス
    # @param [String] tags カンマ区切りで書かれたタグの文字列
    # @param [Array<String>] tags タグの配列
    # @note 日本語にも対応
    def append_tags(filepath, tags)
      if not File::exist?(filepath) then
        raise IOError, "Don't exist file: #{filepath}"
      end

      directory, fname = File::split(filepath)
      ext = File::extname(fname).downcase

      if ext != ".jpg" and ext != ".jpeg" then
        raise IOError, "Don't match extension of JPEG: #{filepath}"
      end

      if tags.class == Array then
        string_tags = tags.join(", ")
      elsif tags.class == String then
        string_tags = tags
      elsif tags.class == Hash then
        string_tags = tags[:all].join(", ")
      end

      result = system("exiftool -m -overwrite_original -Keywords=\"#{string_tags}\" \"#{filepath}\"")

      if not result then
        puts "Failed Append Tags: #{string_tags}"
      end
      return result
    end

    module_function :append_tags
    module_function :convert
  end
end
