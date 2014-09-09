#-*- encoding: utf-8

module DGrab

  class << self

    def listing(c, params)
      c.new.listing(params)
    end

    def show(c, id)
      c.new.show(id)
    end

  end

end