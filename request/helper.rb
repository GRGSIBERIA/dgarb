#-*- encoding: utf-8

require "./helper/config.rb"

module DGrab
  module Request

    class << self

      def listing(cls)
        def cls.listing(params={})
          json = self.new.listing(params)
          class_name = self.to_s.split("::").last
          response = []
          for req in json
            response << Kernel.const_get("DGrab").const_get("Response").const_get(class_name).new(req)
          end
          response
        end
      end

      def show(cls)
        def cls.show(id)
          json = self.new.show(id)
          class_name = self.to_s.split("::").last
          [Kernel.const_get("DGrab").const_get("Response").const_get(class_name).new(json)]
        end
      end

      def get(uri, authorize=true)
        if DGrab::Helper::CONFIG.authorize and authorize then
          AGENT.get(uri + "&login=#{DGrab::Helper::CONFIG.username}&api_key=#{DGrab::Helper::CONFIG.api_key}")
        else
          AGENT.get(uri)
        end
      end

    end
  end

end