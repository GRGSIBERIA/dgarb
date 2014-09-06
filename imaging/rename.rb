#-*- encoding: utf-8

require "rmagick"
require "mini_exiftool"
require "kconv"
require "pp"

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
      image = MiniExiftool.new(path)
      total_tags = image["xpkeywords"] + ";"

      for tag in tags
         total_tags += tag + ";"
      end

      total_tags = total_tags
      image["xpkeywords"] = total_tags
      image["keywords"] = total_tags
      image["lastkeywordxmp"] = total_tags
      image.save!
    end

    module_function :AppendTags
    module_function :Rename
  end
end

#image, path = DW::Image::Rename("C:\\Users\\Eiichi\\Pictures\\2014-09-06\\test.png")
DW::Image::AppendTags("C:\\Users\\Eiichi\\Pictures\\2014-09-06\\test.jpg", ["ほげ", "ぷよ"])