#-*- encoding: utf-8
require "mechanize"
require "openssl"
require "json"

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
I_KNOW_THAT_OPENSSL_VERIFY_PEER_EQUALS_VERIFY_NONE_IS_WRONG = nil

module DGrab
  module Agent
    class Agent
      def initialize()
        @url = "http://danbooru.donmai.us/"
        @agent = Mechanize.new
        @agent.user_agent_alias = 'Windows Mozilla'
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
        JSON::parse(@agent.get(uri).body)
      end

      def showID(apiName, id)
        uri = @url + "#{apiName}/#{id}.json"
        getJSON(uri)
      end

    end
  end

end