#-*- encoding: utf-8

module DGrab

  class << self

    def listing(cls)
      def cls.listing(params={})
        json = self.new.listing(params)
      end
    end

    def show(cls)
      def cls.show(id)
        json = self.new.show(id)
      end
    end

  end

end