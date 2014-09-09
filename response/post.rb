#-*- encoding: utf-8

require "./response/instance.rb"

module DGrab
  module Response

    class Post > Instance
      def initialize(json)
        super(json)
      end
    end

  end
end