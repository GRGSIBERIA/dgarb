#-*- encoding: utf-8

require "rmagick"

module DW
  module Image

    def Rename(filepath)
      path, fname = File::split(filepath)
      ext = File::extname(fname).downcase

      begin
        image = Magick::Image.read(filepath).first
      rescue
        return nil
      end

      if ext == ".png" or ext == ".gif" then
        basename = File::basename(fname, ext)
        image.write(path + "\\" + basename + ".jpg")
      end

      return image
    end

    module_function :Rename
  end
end

puts DW::Image::Rename("C:\\Users\\Eiichi\\Pictures\\2014")