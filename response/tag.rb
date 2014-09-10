#-*- encoding: utf-8

require "./response/presenter.rb"

module DGrab
  module Response

    class Tag < Presenter
      def initialize(json)
        super(json)
      end
    end

  end
end