#-*- encoding: utf-8

require "./agent.rb"

module DW
  class Artist < Agent
    def initialize()
      super
    end

    def listing(params={})
      uri = @url + "artists.json?"
      uri += addParam(params, :limit)
      uri += addParam(params, :page)
      uri += addParam(params, :search_name)
    end
  end
end