#-*- encoding: utf-8

require "rmagick"

module DGrab
  
  # 画像関係のヘルパー関数
  module Image

    # 読み込んだファイルをJPEGに変換する
    # @param [String] filepath JPEG以外のファイルのパス
    # @param [Boolean] is_delete 変換された画像は削除するかどうか
    # @return [Array<String, Boolean>] 新しく生成されたパスと変換の可否を返す
    # @note JPEGが投げられた場合はJPEGのパスを返す．何らかの異常があるとnilが返る．
    def convert(filepath, is_delete=true)
      if not File::exist?(filepath) then
        raise IOError, "Don't exist file: #{filepath}"
      end

      directory, fname = File::split(filepath)
      ext = File::extname(fname).downcase
      new_path = filepath
      converted_flag = false

      if ext == ".png" or ext == ".gif" or ext == ".bmp" or ext == ".tga" then
        
        begin
          image = Magick::Image.read(filepath).first
        rescue
          return nil
        end

        basename = File::basename(fname, ext)
        new_path = directory + "\\" + basename + ".jpg"
        image.write(new_path)

        # 変換済みのPNGはいらないと思うので削除^
        if is_delete and ext != "gif" then
          ::File.unlink filepath
        end

        converted_flag = true
      end

      return new_path, converted_flag
    end

    # 指定したパスのJPEGファイルにタグを追加する
    # @param [String] filepath ファイルのパス
    # @param [String] tags カンマ区切りで書かれたタグの文字列
    # @param [Array<String>] tags タグの配列
    # @return [Symbol] trueは正常に終了，
    # @note 日本語にも対応，戻り値は無視しても構わない
    def append_tags(filepath, tags)
      if not File::exist?(filepath) then
        return :do_not_exist_file
      end

      directory, fname = File::split(filepath)
      ext = File::extname(fname).downcase

      # ここでtagの型等をチェック
      if tags.class == Array then
        string_tags = tags.join(", ")
      elsif tags.class == String then
        string_tags = tags
      elsif tags.class == Hash then
        if tags.has_key?(:all) then
          string_tags = tags[:all].join(", ")
        else
          string_tags = ""
        end
      end

      if string_tags != "" and (ext == ".jpg" or ext == ".jpeg") then
        result = system("exiftool -m -overwrite_original -Keywords=\"#{string_tags}\" \"#{filepath}\"")
      end
    end

    module_function :append_tags
    module_function :convert
  end
end
