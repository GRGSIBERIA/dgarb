#-*- encoding: utf-8
require "mechanize"
require "openssl"

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
I_KNOW_THAT_OPENSSL_VERIFY_PEER_EQUALS_VERIFY_NONE_IS_WRONG = nil

module DW

  class Agent
    def initialize()
      @url = "https://danbooru.donmai.us/"
      @agent = Mechanize.new
    end

  end

end