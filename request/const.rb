#-*- encoding: utf-8

require "mechanize"
require "openssl"

require "./helper/config.rb"

OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
I_KNOW_THAT_OPENSSL_VERIFY_PEER_EQUALS_VERIFY_NONE_IS_WRONG = nil

module DGrab
  module Request
    include DGrab::Helper

    DANBOORU_URL = "https://danbooru.donmai.us/"
    AGENT = Mechanize.new
    AGENT.user_agent_alias = "Windows Mozilla"

    if CONFIG.authorize then
      puts "test"
      AGENT.cookie_jar.add(
        DANBOORU_URL[0..-2],
        Mechanize::Cookie.new(
          CONFIG.username, DANBOORU_URL[0..2], { api_key: CONFIG.api_key }
          ))
    end
  end
end