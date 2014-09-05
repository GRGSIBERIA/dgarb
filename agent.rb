#-*- encoding: utf-8
require "mechanize"
require "openssl"
require "json"

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
I_KNOW_THAT_OPENSSL_VERIFY_PEER_EQUALS_VERIFY_NONE_IS_WRONG = nil

module DW

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
          param_name = param_name.gsub("_", "[") + "]"
        end
        
        uri += "#{param_name}=#{params[typename]}&"
        
      end
      uri
    end

  end

end