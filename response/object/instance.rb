#-*- encoding: utf-8

module DGrab
  module Response
    class Instance

      def initialize(json, keys)
        @keys = keys
        @attribute = {}

        eval_str = "def setup\n"
        for key, value in keys
          
          if json[value].class == String then
              eval_str += "@#{key} = \"#{json[value]}\"\n"
          else
              eval_str += "@#{key} = #{json[value]}\n"
          end
          
          Instance.class_eval %{
            def #{key}
              @#{key}
            end
          }

          @attribute[key] = json[value]
        end
        eval_str += "end\n"
        Instance.class_eval eval_str
        setup
      end

      def [](sym)
        @attribute[sym.to_sym]
      end

      attr_reader :attribute
    end
  end
end