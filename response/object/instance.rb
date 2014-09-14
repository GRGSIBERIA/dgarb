#-*- encoding: utf-8

module DGrab
  module Response
    class Instance

      def initialize(json, keys)
        @keys = keys
        @attribute = {}

        eval_str = "def self.setup\n"
        for key, value in keys

          str = "#{json[value]}".gsub("\"", "\\\"")
          eval_str += "@#{key} = \"" + str + "\"\n"

          eval %{
            def self.#{key}
              @#{key}
            end
          }

          @attribute[key] = json[value]
        end

        eval_str += "end\n"
        eval eval_str
        self.setup
      end

      def [](sym)
        @attribute[sym.to_sym]
      end

      attr_reader :attribute
    end
  end
end