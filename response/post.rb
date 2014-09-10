#-*- encoding: utf-8

require "./response/presenter.rb"

module DGrab
  module Response

    class Post < Presenter
      def initialize(json)
        super(json)
      end

      def crated_at
        @json[:created_at]
      end
    end

  end
end