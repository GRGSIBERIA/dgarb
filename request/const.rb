#-*- encoding: utf-8

require "mechanize"
require "openssl"

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
I_KNOW_THAT_OPENSSL_VERIFY_PEER_EQUALS_VERIFY_NONE_IS_WRONG = nil

module DGrab
  module Request
    DANBOORU_URL = "https://danbooru.donmai.us/"
    AGENT = Mechanize.new
    AGENT.user_agent_alias = "Windows Mozilla"
  end
end