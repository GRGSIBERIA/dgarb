#-*- encoding: utf-8

require "./response/adapter.rb"

module DGrab
  module Response

    class Post > Adapter
      def initialize(json)
        super(json, DGrab::Instance::Post)
      end

    end

  end
end