#-*- encoding: utf-8

require "./response/presenter.rb"

module DGrab
  module Response

    class RelatedTag < Presenter
      def initialize(json)
        super(json)
      end
    end

  end
end