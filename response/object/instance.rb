#-*- encoding: utf-8

module DGrab
  module Response
    class Instance

      def initialize(json, keys)
        @attributes = {}
        @keys = keys
        for key in keys
          @attributes[key.to_sym] = json[key]
        end
      end

    end
  end
end