#-*- encoding: utf-8

require "rmagick"

module DW
  module Image

    def Rename(filepath)
      path, fname = File::split(filepath)
      ext = File::extname(fname).downcase

      new_path = filepath

      begin
        image = Magick::Image.read(filepath).first
      rescue
        return nil
      end

      if ext == ".png" or ext == ".gif" then
        basename = File::basename(fname, ext)
        new_path = path + "\\" + basename + ".jpg"
        image.write(new_path)
      end

      return image, new_path
    end

    def AppendTags(path, tags)
      total_tags = tags.join(", ")

      result = system("exiftool #{path} -Keywords=\"#{total_tags}\"")

      if not result then
        puts "Failed Append Tags: #{total_tags}"
      end
      return result
    end

    module_function :AppendTags
    module_function :Rename
  end
end

DW::Image::AppendTags("C:\\Users\\Eiichi\\Pictures\\2014-09-06\\test.jpg", ["hoge", "puyo", "山田", "高山"])