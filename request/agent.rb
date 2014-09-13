#-*- encoding: utf-8
require "json"

require "./request/helper.rb"
require "./request/const.rb"
require "./helper/config.rb"

module DGrab

  module Request
    class Agent
      include DGrab::Helper

      def initialize()

      end

      def addParam(params, typename)
        uri = ""
        if params.has_key?(typename) then
          param_name = typename.to_s
          if param_name.include?("_") then
            spl = param_name.split("_")
            param_name = spl[0] + "[" + spl[1]
            spl.shift
            spl.shift
            for x in spl
              param_name += "_" + x
            end
            param_name += "]"
          end

          uri += "#{param_name}=#{params[typename]}&"
        end
        uri
      end

      def getJSON(uri)
        uri = URI.escape(uri[0..-2])
        if CONFIG.authorize then
          JSON::parse(AGENT.get(uri + "&login=#{CONFIG.username}", {api_key: CONFIG.api_key}).body)
        else
          JSON::parse(AGENT.get(uri).body)
        end
      end

      def showID(apiName, id)
        uri = DANBOORU_URL + URI.encode("#{apiName}/#{id}.json")
        getJSON(uri)
      end

    end
  end

end